# EX4 Black-Scholees Option Pricing
```
Function BSPrice(S, K, r, tau, sigma, call_put)
    
    d1 = (Log(S / K) + (r + 0.5 * (sigma) ^ 2) * tau) / (sigma * Sqr(tau))
    d2 = d1 - sigma * Sqr(tau)
    Nd1 = Application.NormSDist(d1)
    Nd2 = Application.NormSDist(d2)
    
    If call_put = "call" Then
        BSPrice = S * Nd1 - K * Exp(-r * tau) * Nd2
    ElseIf call_put = "put" Then
        BSPrice = K * Exp(-r * tau) * (1 - Nd2) - S * (1 - Nd1)
        
    End If
            
End Function

```