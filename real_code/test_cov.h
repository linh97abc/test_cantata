#ifndef _TEST_COV_H_
#define _TEST_COV_H_
#include <iostream>

class coverage
{
public:
  virtual int do_coverage (int A,int B,int C);
};

class cov1 : public coverage
{
public:
  int do_coverage (int A,int B,int C);
};

class cov2 : public coverage
{
public:
  int do_coverage (int A,int B,int C);
};

class cov3 : public coverage
{
public:
  int do_coverage (int A,int B,int C);
};


#endif
