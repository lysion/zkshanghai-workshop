pragma circom 2.1.4;

template IsZero () {
    signal input in;
    
    signal output out;

    signal inv <-- in == 0 ? 0 : 1/in; // 计算 inv 的值


    // 约束
    out <== -in * inv + 1;
    in * out === 0;
}

component main = IsZero();

/* INPUT = {
    "in": "0"
} */
