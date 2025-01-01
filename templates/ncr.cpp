const int factN = 1e6 + 5;
int ff[factN];
int iff[factN];
bool facinit = false;

int power(int x, int y) {
  if (y == 0)
    return 1;
  int ans = 1;
  while (y > 0) {
    if (y % 2 == 1) {
      ans = (ans * x) % mod;
    }
    x = (x * x) % mod;
    y = y / 2;
  }
  return ans % mod;
}

void factorial() {
  facinit = true;
  ff[0] = iff[0] = 1;

  for (int i = 1; i < factN; i++) {
    ff[i] = 1LL * ff[i - 1] * i % mod;
  }

  iff[factN - 1] = power(ff[factN - 1], mod - 2);
  for (int i = factN - 2; i >= 1; i--) {
    iff[i] = 1LL * iff[i + 1] * (i + 1) % mod;
  }
}

int ncr(int n, int r) {
  if (!facinit)
    factorial();
  assert(0 <= r && r <= n);
  return 1LL * ff[n] * iff[r] % mod * iff[n - r] % mod;
}
