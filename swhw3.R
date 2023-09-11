#SW HW3 -- Plotting horizontal wind speed profiles

k <- 0.4 #von Karman's constant (unitless)
zm <- 2 #measurement height (m)
uzm <- 4 #measured wind speed (m/s)

zveg <- c(0.5,1.5) #vegetation height (m)
zd <- .7*zveg #zero-plane displacement height (m)
z0 <- .1*zveg #roughness height (m)

ustar <- (k*uzm)/log((zm-zd)/z0) #friction velocity (m/s)

z1 <- seq(zd[1]+z0[1],5,by=0.001)
z2 <- seq(zd[2]+z0[2],5,by=0.001)
uz1 <- (1/k)*ustar[1]*log((z1-zd[1])/z0[1]) #wind speed for zveg=0.5m
uz2 <- (1/k)*ustar[2]*log((z2-zd[2])/z0[2]) #wind speed for zveg=1.5m

plot(uz1,z1,type="l",col="cornflowerblue", xlim=c(0,8),
     xlab="Horizontal wind speed velocity (m/s)",
     ylab="Altitude (m)")
lines(uz2,z2,type="l",col="palevioletred")
legend(0,5,title="Veg height",legend=c("0.5 m","1.5 m"),
       col=c("cornflowerblue","palevioletred"),lty=1:1,cex=0.8)

