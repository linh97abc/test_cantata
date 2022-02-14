#include <iostream>
#include "test_cov.h"

using namespace std;

int coverage::do_coverage (int A,int B,int C)
{
  /* this function is never called */
  return 1;
}

int cov1::do_coverage (int A,int B,int C)
{
  int D = 0;

  if (A && (B || C))
  {
    D = 1;
  }
  else
  {
    D=0;
  }
  return (D);
}

int cov2::do_coverage (int A,int B,int C)
{
  int D = 0;
  int z;

  z = (A && (B || C));

  if (z)
  {
    D = 1;
  }
  else
  {
    D=0;
  }
  return(D);
}

int cov3::do_coverage (int A,int B,int C)
{
  int D = 0;

  if (A || (B && C))
  {
    if (A && (B || C))
    {
      D=1;
    }
    else { D=0;};
  }
  else
  {
    D = 0;
  }
  return D;
}
