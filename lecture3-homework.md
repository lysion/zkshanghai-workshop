# 第3课 课后作业

## 二次非剩余 

完备性：
如果$QR(m, x) = 0$
当$b=0$时，$y = s^2x$，prover是诚实的，计算$QR(m,y) = QR(m,s^2x)$，由于$QR(m,x) = 0$，则一定有$QR(m,s^2x) = 0$，因此verifier接收到的就是0，验证$QR(m,y) = 0 = b$，验证者接受;当$b=1$时，$y = s^2$，prover计算$QR(m,y) = QR(m,s^2)$，$s^2$一定是模$m$的二次剩余，根据定义存在数$s$，使得$s^2 = s^2 \mod m$。因此$QR(m,s^2) = 1$，verifier就会接收到1，验证$QR(m,y) = 1 = b$，验证者接受；
因此验证者总是接受的。

可靠性：
如果$QR(m,x) =1$，则$x$是模$m$的二次剩余。如果verifier选择$b=0$，发送$y = s^2x$，$QR(m,y) = QR(m,s^2x) = 1 \neq b$；
如果Verifier选择$b = 1$，发送$y = s^2$，$QR(m,y) = QR(m,s^2) = 1 = b$。对于prover来说，如果诚实计算$QR(m,y)$，只会有1/2的概率通过验证，如果不诚实计算$QR(m,y)$，不会有超过1/2概率通过验证。
最终，Verifier都会以超过1/2的概率拒绝。

## 二次剩余

完备性：
当$b=0$时，prover向verifier发送$u=t$，verifier计算$u^2x = $，因此Verifier接受；当$b = 1$时，prover向verifier发送$u = st$，Verifier计算$u^2 = (st)^2 = t^2x = y$，因此Verifier接受

可靠性：
如果$QR(m,x) = 0$
$b=0$，prover选择$u=t$会通过验证，因为$y=xt^2 = u^2x \mod m$；
$b=1$，verifier会验证$y = xt^2 = u^2 \mod m$。由于$QR(m,x)=0$，不会存在一个数$s$，使得$s^2 = x \mod m$，将Verifier验证的等式变形为$x = (\frac{u}{t})^2 \mod m$，由于不存在这样的数，因此这里Verifier会验证失败，当然prover不知道有效的$s$使得$s = \frac{u}{t}$，verifier会验证失败。
最终，verifier会以超过1/2的概率拒绝。
