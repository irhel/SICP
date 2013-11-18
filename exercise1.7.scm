#lang scheme
; (sqrt 0.001) yields 0.03230844833048122, however, the correct answer would 0.01.
; (sqrt 0.000001) yields 0.031260655525445276, however, the correct answr would be 0.001.
; To fix it make the absolute tolerance 0.00000000001, the smaller the absolute tolerance the more precise the answer.