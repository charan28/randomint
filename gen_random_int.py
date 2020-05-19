from random import randint

# generate a random number from 0-1
random_int = randint(0, 1)

# print the random number out to console
print(random_int)

# write the random number to a text file
f = open("/share/output.txt", "w")
f.write(str(random_int))
f.close()
