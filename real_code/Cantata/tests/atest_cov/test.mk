#
# Generated makefile for test "atest_cov"
#

#
# Stop the MAKEFLAGS variable being exported.
# This is needed for sub-make processes to use different options.
#
unexport MAKEFLAGS

#
# The name of the test
#
THIS_TEST := atest_cov

#
# Test script file
#
atest_cov_TESTOBJ := atest_cov

#
# Software under test
#
atest_cov_SUTOBJ := cov

#
# Compile and link as 'C' or 'CXX'
#
atest_cov_C_OR_CPP_MODE := CXX

#
# Additional libraries to link
#
atest_cov_EXTLIBS := 

#
# Additional object files to link
#
atest_cov_EXTOBJS := 

#
# Additional defines for this test
#
atest_cov_DEFINES := 

#
# Additional includes for this test
#
atest_cov_INCLUDES := 

#
# Include the test definitions makefile
#
include ../configuration/test_defs.mk

#
# Rules for compiling the software under test
#
atest_cov/cov.o : ../../cov.cpp
	$(MKDIR_CMD) -p atest_cov
	@$(RM_CMD) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),1,0,0,0,0 >> $(CANTPP_TOP_LEVEL_LOG)
	-@$(ECHO_CMD_MED) ../../cov.cpp > $(DYNAMIC_THIS_TEST)/filelist.lst
	-@$(QAC_CMD)
	$(subst %DEFINES%, $(foreach define,$(atest_cov_ALL_DEFINES),$(DEFINE_OPT)$(define)), $(subst %INCLUDES%, $(foreach include,$(atest_cov_ALL_INCLUDES),$(subst %s,$(include),$(INCLUDE_PATH_OPT))), $(subst %n,$(DYNAMIC_THIS_TEST)/$(atest_cov_SUTOBJ),$(COMPILE_CXX_CMD))))

#
# Rule for compiling the test script
#
atest_cov/atest_cov.o : atest_cov/atest_cov.cpp
	$(MKDIR_CMD) -p atest_cov
	@$(RM_CMD) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),1,0,0,0,0 >> $(CANTPP_TOP_LEVEL_LOG)
	-@$(ECHO_CMD_MED) atest_cov/atest_cov.cpp > $(DYNAMIC_THIS_TEST)/filelist.lst
	$(subst %DEFINES%, $(foreach define,$(atest_cov_ALL_DEFINES),$(DEFINE_OPT)$(define)), $(subst %INCLUDES%, $(foreach include,$(atest_cov_ALL_INCLUDES),$(subst %s,$(include),$(INCLUDE_PATH_OPT))), $(subst %n,$(DYNAMIC_THIS_TEST)/$(atest_cov_SUTOBJ),$(COMPILE_CXX_CMD))))

#
# Rule for linking the test executable
#
$(atest_cov_TEST_EXE) : \
	$(atest_cov_SUTOBJ_FILENAMES) \
	$(atest_cov_TESTOBJ_FILENAMES) \
	$(atest_cov_EXTRA_DEPENDS)
	@$(RM_CMD) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg
	@$(ECHO_CMD_MED) ",,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),1,0,0,1,0" >> $(CANTPP_TOP_LEVEL_LOG)
	$(subst %EXTLIBS%, $(foreach extlib,$(atest_cov_ALL_EXTLIBS),$(subst %s,$(extlib),$(atest_cov_LINK_EXTLIBOPT))), $(subst %n,$(DYNAMIC_THIS_TEST)/atest_cov,$(subst %EXTOBJS%,$(atest_cov_EXTOBJS),$(CXX_LINK_CMD))))
	@$(ECHO_CMD_MED) Built atest_cov successfully

#
# Rule for running the test executable
#
$(atest_cov_CTR_FILE) : $(atest_cov_TEST_EXE)
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),0,1,0,1,0 >> $(CANTPP_TOP_LEVEL_LOG)
	@$(RUN_CMD)
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),0,0,1,0,0 >> $(CANTPP_TOP_LEVEL_LOG)
	@$(CPPCCA_GENERATE_CMD)

#
# Rule for ensuring nothing is built/run unless the ctr file is out of date
#
$(atest_cov_RUN) : $(atest_cov_CTR_FILE)

#
# Rule for controlling the building and running of the test executable
#
ifeq ($(EXECUTE),1)
ifeq ($(PUSH_TO_SERVER),1)
$(atest_cov_BUILD_AND_RUN) : 
	-@$(MAKE) $(atest_cov_RUN) --warn-undefined-variables -s -f $(DYNAMIC_THIS_TEST)/test.mk 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	@$(ECHO_CMD_MED) Uploading test results to Cantata Server...
	@$(JAVA_CMD) -cp "$(CANTATA_INSTALL_DIR)/bin/client.jar" com.qas.cantata.client.control.CCLC filesToLoad=$(DYNAMIC_THIS_TEST)/.*.ctr,$(DYNAMIC_THIS_TEST)/.*.ctg,$(DYNAMIC_THIS_TEST)/.*.cov,../../cov.cpp,$(DYNAMIC_THIS_TEST)/atest_cov.cpp optionsFiles=../../ipg.cop,$(DYNAMIC_THIS_TEST)/ipg.cop 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	-@$(CTR2HTML_CMD)
	@$(CTR_STATE_CMD)
else
$(atest_cov_BUILD_AND_RUN) : 
	-@$(MAKE) $(atest_cov_RUN) --warn-undefined-variables -s -f $(DYNAMIC_THIS_TEST)/test.mk 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	-@$(CTR2HTML_CMD)
	@$(CTR_STATE_CMD)
endif
else
$(atest_cov_BUILD_AND_RUN) : 
	@$(MAKE) $(atest_cov_TEST_EXE) --warn-undefined-variables -s -f $(DYNAMIC_THIS_TEST)/test.mk 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	@$(ECHO_CMD_MED) Finished $(DYNAMIC_THIS_TEST)
endif

#
# Rules for generating the required folder structure
#

#
# Additional dependencies
#
atest_cov/atest_cov.o : ../../ipg.cop
atest_cov/atest_cov.o : ../../test_cov.h
atest_cov/atest_cov.o : atest_cov/ipg.cop
atest_cov/cov.o : ../../ipg.cop
atest_cov/cov.o : ../../test_cov.h
atest_cov/cov.o : atest_cov/ipg.cop


