treatment_planning_data
m = mtumor + mother;
cvx_begin
variables b(n) d(m)
minimize( sum(max(d(mtumor+1:m) - Dother, 0)) )
subject to
d(1:mtumor) == Atumor*b
d(mtumor+1:m) == Aother*b
b >= 0
b <= Bmax
d(1:mtumor) >= Dtarget
cvx_end
figure(1)
hist(d(1:mtumor))
figure(2)
hist(d(mtumor+1:m))
