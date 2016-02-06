---
title: Learning Elixir - Functional vs Object-oriented
date: 2016-02-06 19:52 UTC
tags: elixir, functional, object-oriented
category: software developer
---

For the most of my dev life I've been doing [Object-oriented programming](https://en.wikipedia.org/wiki/Object-oriented_programming) (OOP). But as I mentioned in my [previous post](https://hovancik.net/blog/2016/01/28/learning-elixir-or-what-is-couple-programming.html), lately I started to learn Elixir language with my non-programmer [girlfriend](https://ontheshelf.github.io/). 

It's been a lot of fun so far. 

In this post I would like to write about what I feel are the differences between OOP and [functional programming](https://en.wikipedia.org/wiki/Functional_programming) (FP). I will be over-simplifying, as this post is meant to be for someone who is not faminliar with any of those concepts. 

###OOP
Let's say we have a blueprint of car (*a class*) so we can create an instance of car (*the object*). That car would have 4 wheels, actual speed (*attributes*) and means of speeding up or down (*methods*) so we can do some weird stuff with it (*mutate* it). 

```ruby
fastie = Car.new     #creating new car
fastie.actual_speed? #asking for actual speed  
	> 0 km/h         #the answer
fastie.speed_up!     #let's rock and roll
fastie.actual_speed?
	> 100 km/h
```


###FP

FP is all about Math. We have mathematical expressions (*functions*) that help us to do weird stuff to our data (*transforming* them). 

```ruby
speed = 0 				#let's say we are at 0 			
Speed.current(speed)    #asking for actual speed
	> 0 km/h            #just adding km/h to value 
speed1 = Speed.up(speed + 100)
                        #speeding up
Speed.current(speed1)
	> 100 km/h           	
```  



###In other words.
In FP, we don't change the data (like in OOP), we transform them into new data (*speed->speed1*). In other words, `fastie` was changed/mutated, but on the other hand, `speed` was not. 

In FP we take similar functions and put them into modules, eg. `Speed`. They do not change our data, they create new sets of data depending on what they are supposed to do. Same input have always same output. 

In OOP, we have classes, that are something like blueprints, containing methods telling us how to change the state of object created from class. Same input does not need to mean that output will be same as well (there might be someone else doing some weird stuff with speed the same time as you do).

###None is better. 
In the end it always depends on what kind of problem you are trying to solve: 
> Always choose the best tool for the job.  


