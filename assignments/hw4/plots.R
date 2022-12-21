options(scipen=999)
top = read.csv(file = 'top.csv')
kal = read.csv(file = 'kal.csv')

lt34 <- read.table(file = 'lt34.csv')
lt35 <- read.csv(file = 'lt35.csv')
lt36 <- read.csv(file = 'lt36.csv')
lt46 <- read.csv(file = 'lt46.csv')
lt47 <- read.csv(file = 'lt47.csv')
lt48 <- read.csv(file = 'lt48.csv')


png(file = "lt34.png")
plot(lt34,
     xlab = "Kallisto",
     ylab = "Tophat",
     main = "LT34"
)
dev.off()

png(file = "lt35.png")
plot(lt35,
     xlab = "Kallisto",
     ylab = "Tophat",
     main = "LT35"
)
dev.off()

png(file = "lt36.png")
plot(lt36,
     xlab = "Kallisto",
     ylab = "Tophat",
     main = "LT36"
)
dev.off()

png(file = "lt46.png")
plot(lt46,
     xlab = "Kallisto",
     ylab = "Tophat",
     main = "LT46"
)
dev.off()

png(file = "lt47.png")
plot(lt47,
     xlab = "Kallisto",
     ylab = "Tophat",
     main = "LT47"
)
dev.off()

png(file = "lt48.png")
plot(lt48,
     xlab = "Kallisto",
     ylab = "Tophat",
     main = "LT48"
)
dev.off()

cor(kal[2], top[2], method="pearson")^2
cor(kal[3], top[3], method="pearson")^2
cor(kal[4], top[4], method="pearson")^2
cor(kal[5], top[5], method="pearson")^2
cor(kal[6], top[6], method="pearson")^2
cor(kal[7], top[7], method="pearson")^2
