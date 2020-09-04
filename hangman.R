## ----------------------------------------------------------------------------
## Hangman for R
## ----------------------------------------------------------------------------
## Author : Marek Hlavac (Political Economy and Government, Harvard University)
## E-mail : mhlavac at alumni.princeton.edu
## Date   : August 29, 2012
## ----------------------------------------------------------------------------
## new.game()     begins a new game of hangman
## guess(x)       guesses a letter 'x' from the alphabet, e.g.: guess("b")
## ----------------------------------------------------------------------------
## IMPORTANT: Make sure "hangman.RData" is in the working directory. You can
##            use the setwd() command to ensure this is the case.
## ----------------------------------------------------------------------------

guess <- function(letter) {
  if (number.mistakes >= 7) {
    cat("You've already lost, you lowly loser. Use new.game() to start a new game of hangman. \n")
  }
  else if (word.display == hangman.word) {
    cat("Just in case you didn't notice, you've already won. Use new.game() to start a new game of hangman. \n")
  }
  else if (!is.letter(letter)) {
   cat("You can only guess letters from the alphabet, you absent-minded amateur! \n")
  }
  else if (toupper(letter) %in% used.letters) {
    cat("You've already used \"",toupper(letter),"\", you forgetful fool. \n", sep="")
  }
  else {
    word.display.new <- ""
    found <- FALSE
    for (i in seq(1:n)) {
      if (tolower(substr(hangman.word,i,i)) == tolower(letter)) {
        word.display.new <- paste(word.display.new, substr(hangman.word,i,i), sep="")
        found <- TRUE
      }
	else { word.display.new <- paste(word.display.new, substr(word.display,i,i), sep="") }
    }
	
    word.display <<- word.display.new
  
    if (found==FALSE) {
      if (used.letters[1] == "none yet") { used.letters <<- toupper(letter) }
      else { used.letters <<- c(used.letters,toupper(letter)) }
      number.mistakes <<- number.mistakes + 1
    }
    .display()
  }
}

is.letter <- function(x) (is.character(x) & grepl("[[:alpha:]]", x) & (nchar(x)==1))

catn <- function(s)
{
 cat(s,"\n",sep="") 
}

.display <- function() {
  cat("-----------------------------------------------------\n")

  if (number.mistakes < 7) { cat(hangman.category, ":    ", word.display, sep="") }
  else { cat(hangman.category, ":    ", hangman.word, sep="") }

  cat("\n")
  # put hangman here
  if (number.mistakes==0) {
    catn(" ================ ")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
  }
  else if (number.mistakes==1) {
    catn(" ================ ")
    catn(" ||         |")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
  }
  else if (number.mistakes==2) {
    catn(" ================ ")
    catn(" ||        _|_")
    catn(" ||       /   \\")
    catn(" ||       |   |")
    catn(" ||       \\___/")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
  }
  else if (number.mistakes==3) {
    catn(" ================ ")
    catn(" ||        _|_")
    catn(" ||       /   \\")
    catn(" ||       |   |")
    catn(" ||       \\___/")
    catn(" ||         |")
    catn(" ||         |")
    catn(" ||         |")
    catn(" ||         |")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
  }
  else if (number.mistakes==4) {
    catn(" ================ ")
    catn(" ||        _|_")
    catn(" ||       /   \\")
    catn(" ||       |   |")
    catn(" ||       \\___/")
    catn(" ||         |")
    catn(" ||        /|")
    catn(" ||       / |")
    catn(" ||         |")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
  }
  else if (number.mistakes==5) {
    catn(" ================ ")
    catn(" ||        _|_")
    catn(" ||       /   \\")
    catn(" ||       |   |")
    catn(" ||       \\___/")
    catn(" ||         |")
    catn(" ||        /|\\")
    catn(" ||       / | \\")
    catn(" ||         |")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    catn(" ||")
  }
  else if (number.mistakes==6) {
    catn(" ================ ")
    catn(" ||        _|_")
    catn(" ||       /   \\")
    catn(" ||       |   |")
    catn(" ||       \\___/")
    catn(" ||         |")
    catn(" ||        /|\\")
    catn(" ||       / | \\")
    catn(" ||         |")
    catn(" ||        /")
    catn(" ||       /")
    catn(" ||")
    catn(" ||")
    catn(" ||")
  }
  else if (number.mistakes==7) {
    catn(" ================ ")
    catn(" ||        _|_")
    catn(" ||       /   \\")
    catn(" ||       |   |")
    catn(" ||       \\___/       *****************")
    catn(" ||         |         * YOU LOSE, LOL *")
    catn(" ||        /|\\        *   EPIC FAIL   * ")
    catn(" ||       / | \\       *****************")
    catn(" ||         |")
    catn(" ||        / \\")
    catn(" ||       /   \\")
    catn(" ||")
    catn(" ||")
    catn(" ||")
    if (result.recorded == FALSE) {
	number.losses <<- number.losses + 1
	result.recorded <<- TRUE
    }
  }

  if (word.display == hangman.word) {
      if (result.recorded == FALSE) {
 	  number.victories <<- number.victories + 1
	  result.recorded <<- TRUE
      }
	catn("")
	catn("******************************************")
	catn("*           YOU WON, WOOT WOOT!          *")
	catn("*                                        *")
	catn("*  new.game() for a new game of hangman  *")
  }
  
  if ((word.display == hangman.word) | (number.mistakes >= 7)) {
	catn("******************************************")
	cat("Games      :  ", number.games, "\n", sep="")
	cat("Victories  :  ", number.victories, " (", (number.victories / number.games)*100,"%) \n", sep="")
	cat("Losses     :  ", number.losses, " (", (number.losses / number.games)*100,"%) \n", sep="")
	catn("******************************************")
  }

  
  cat("\n")
  cat("Used letters:    ")
  cat(used.letters, "\n")
  cat("-----------------------------------------------------\n\n")
}

.set.up <- function() {
  word.display <<- NULL
  for (i in seq(1:n)) {    
    if (!is.letter(substr(hangman.word,i,i))) {
      word.display <<- paste(word.display, substr(hangman.word,i,i), sep="")
    }
    else { word.display <<- paste(word.display,".",sep="") }
  }
  .display()

}

# write introduction
.intro <- function() {
	catn("")
	catn("----------------------------------------------------------------------------")
	catn("Hangman for R")
	catn("----------------------------------------------------------------------------")
	catn("Author : Marek Hlavac (Political Economy and Government, Harvard University)")
	catn("E-mail : mhlavac at alumni.princeton.edu")
	catn("Date   : August 29, 2012")
	catn("----------------------------------------------------------------------------")
	catn("new.game()     begins a new game of hangman")
	catn("guess(x)       guesses a letter 'x' from the alphabet, e.g.: guess(\"b\")")
	catn("----------------------------------------------------------------------------")
	catn("IMPORTANT: Make sure \"hangman.RData\" is in the working directory. You can")
	catn("           use the setwd() command to ensure this is the case.")
	catn("----------------------------------------------------------------------------")
	catn("")
}


new.game <- function() {
  # randomly select a word
  which.one <- round(runif(1,1,nrow(hangman)))
  hangman.category <<- hangman[which.one,"category"]
  hangman.word <<- hangman[which.one,"word"]
  n <<- nchar(hangman.word)

  # set other variables
  used.letters <<- c("none yet")
  number.mistakes <<- 0
  result.recorded <<- FALSE

  number.games <<- number.games + 1
  
  .set.up()
}

#set up
load("hangman.RData")

number.games <- 0
number.victories <- 0
number.losses <- 0

.intro()

# automatically start a new game
new.game()
