function result = contrast(a)

highmask = a>0.9;
lowmask = a<(1-0.9);

a(highmask) = 1;
a(lowmask) = 0;
result = a;
end
