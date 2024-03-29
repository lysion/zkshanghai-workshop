pragma circom 2.1.4;

// 转换为二进制
template Num2Bits(n) {
    signal input in;
    signal output out[n];

    for (var i = 0; i < n; i++) {
        out[i] <-- (in \ 2**i) % 2;
    }

    var accm = 0;
    for (var i = 0; i < n; i++) {
        accm += out[i] * 2**i;
    }
    accm === in;


    for (var i = 0; i < n; i++) {
        out[i] * (1 - out[i]) === 0;
    }
}


// in[0] < in[1] 返回 1，否则返回0
template LessThan (n) {
    assert(n <= 252);
    signal input in[2];
    signal output out;

    component n2b = Num2Bits(n+1);
    n2b.in <== in[1] - in[0] + (2**n); 
    out <== n2b.out[n];
}

component main = LessThan(3);

/* INPUT = {
    "in": ["3", "4"]
} */
