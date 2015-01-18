void setup(){
//  int result = Combination(3,1);
//  int result = FactorialI(5);
  double result = NapierConstant(1);
//  double result = SquareRoot(9,8);
  println(result);
}

// nCm
int Combination(
int n, 
int m)
{
  if(n < m || m < 0)return 0;
  return FactorialI(n) / (FactorialI(m) * FactorialI(n - m));
}

// n!
// n >= 16 -> error
int FactorialI(int n){
  if(n < 1)return 0;
  if(n < 2)return 1;
  return n * FactorialI(n-1);
}

// n >= 26 -> error
long FactorialL(int n){
  if(n < 1)return 0;
  if(n < 2)return 1;
  return n * FactorialL(n-1);
}

// e = 2.71828182846...
double NapierConstant(int x){
  
  if(x < 1)return 0.0;
  double result = 1.0;
  
  for(int n = 1; n < 26; n++){
    result += 1.0 / FactorialL(n);
  }
  return result;
}

// root
double SquareRoot(
int n,
int itr)
{
  if(n < 0 || itr < 0)return 0.0;
  double x = 1.0;
  for(int i = 0; i < itr; i++){
    double fx = x*x-n;
    double gx = 2*x;
    x = x - fx / gx;
  }
  return x;
}
