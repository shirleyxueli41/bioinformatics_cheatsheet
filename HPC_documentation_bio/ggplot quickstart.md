 ```r
mammals <- MASS::mammals     
ggplot(mamals, aes(x=body, y=brain)) +
    geom_point()

 ```