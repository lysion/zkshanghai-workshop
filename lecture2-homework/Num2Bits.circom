pragma circom 2.1.4;

template Num2Bites (n) {
    signal input in;
    
    signal output out[n];

    // 计算input的二进制
    for (var i = 0; i < n; i++) {
        out[i] <-- (in \ 2 ** i) % 2;
    }

    // 约束
    var sum = 0; // 累加
    for (var i = 0; i < n; i++) {
        sum += out[i] * 2**i;
    }
    sum === in; 

    for (var i = 0; i < n; i++) {
        0 === out[i] * (1 - out[i]);
    }
}

component main = Num2Bites(17);

/* INPUT = {
    "in": "10"
} */
