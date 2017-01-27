import System.IO

player1 = "Player 1, please chose where to put X from positions 1-9"
player2 = "Player 2, please chose where to put O from positions 1-9"

winner :: [String] -> Bool
winner t = ((t!!0 == t!!1 && t!!1 == t!!2) && t!!1 /= "-")
		   || ((t!!3 == t!!4 && t!!4 == t!!5) && t!!3 /= "-")
		   || ((t!!6 == t!!7 && t!!7 == t!!8) && t!!6 /= "-")
		   || ((t!!0 == t!!3 && t!!3 == t!!6) && t!!0 /= "-")
		   || ((t!!1 == t!!4 && t!!4 == t!!7) && t!!1 /= "-")
		   || ((t!!2 == t!!5 && t!!5 == t!!8) && t!!2 /= "-")
		   || ((t!!0 == t!!4 && t!!4 == t!!8) && t!!0 /= "-")
		   || ((t!!2 == t!!4 && t!!4 == t!!6) && t!!2 /= "-")

makeTurn :: [String] -> Int -> String -> [String]
makeTurn [] _ _ = []
makeTurn (x:xs) pos symbol = 
	if pos == 0 
		then [symbol] ++ makeTurn xs (pos-1) symbol
		else [x] ++ makeTurn xs (pos-1) symbol

printTable :: [String] -> IO ()
printTable chessTable = do
	putStrLn $ "  " ++ chessTable!!0 ++ "  " ++ chessTable!!1 ++"  " ++ chessTable!!2
	putStrLn $ "  " ++ chessTable!!3 ++ "  " ++ chessTable!!4 ++"  " ++ chessTable!!5
	putStrLn $ "  " ++ chessTable!!6 ++ "  " ++ chessTable!!7 ++"  " ++ chessTable!!8

draw :: [String] -> Bool
draw [] = True
draw (x:xs) = if (x == "-")
	then False
	else draw xs

startTicTacToe :: [String] -> IO ()
startTicTacToe chessTable = do
	putStrLn player1
	pos <- readLn :: IO Int
	if (pos < 10 && pos > 0)
		then if ("-" == chessTable!!(pos-1)) 
				then do 
					let changeTable1 = makeTurn chessTable (pos-1) "X"
					printTable changeTable1
					if winner changeTable1
						then putStrLn "Player 1 has won the game"
						else do 
							putStrLn player2
							pos2 <- readLn :: IO Int
							if (pos2 < 10 && pos2 > 0)
								then if (("-" == changeTable1!!(pos2-1)) || draw changeTable1) 
										then do 
											let changeTable2 = makeTurn changeTable1 (pos2-1) "O"
											printTable changeTable2
											if winner changeTable2
												then putStrLn $ "Player 2 has won the game"
												else 
													if draw changeTable2 
														then putStrLn "DRAW!!" 
														else startTicTacToe changeTable2
										else putStrLn "Position already taken, please restart the game!"
								else putStrLn "No such poition, please restart the game!"		
				else do 
					putStrLn $ "Position already taken: " ++ (show pos)
					startTicTacToe chessTable
		else do 
			putStrLn $ "No such position: " ++ (show pos)
			startTicTacToe chessTable 
			