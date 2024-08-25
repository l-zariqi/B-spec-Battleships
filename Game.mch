/* Game
 * Author: Lind Zariqi
 */
MACHINE
    Game

SEES
    Player1_Grid


SETS
    REPORT = {FLEET_DEPLOYED, P1_FLEET_DEPLOYED, P2_FLEET_DEPLOYED, CANNOT_DEPLOY_FLEET, SHIP_DESTROYED, P1_SHIP_DESTROYED, P2_SHIP_DESTROYED, FLEET_DESTROYED, P1_FLEET_DESTROYED, P2_FLEET_DESTROYED,SHOT_HIT, P1_SHOT_HIT, P2_SHOT_HIT, SHOT_MISS, P1_SHOT_MISS, P2_SHOT_MISS, LOCATION_OF_SHIPS, P1_LOCATION_OF_SHIPS, P2_LOCATION_OF_SHIPS};
    GAME_STATUS = {GameOver}

//CONSTANTS
    

//PROPERTIES
    

DEFINITIONS
    isWithinGrid(xx, yy) == (xx |-> yy : grid);
    isHitWater(xx, yy) == (xx |-> yy : water);
    isHitShip(xx, yy) == (xx |-> yy : shipPiece);
    isHitDestroyedShip(xx, yy) == (xx |-> yy : destroyedShipGrid);
    isGameFinished == shipsCount := 0

VARIABLES
    xPosition, yPosition, numberOfShips, numberOfShots, numberOfDestroyedShips


INVARIANT
    xPosition : gridX &
    yPosition : gridY &
    xPosition |-> yPosition : waterGrid &
    numberOfShips : NAT &
    numberOfShots : NAT &
    numberOfDestroyedShips : NAT 
    

INITIALISATION
    numberOfShips := 3 ||
    numberOfShots := 0 ||
    numberOfDestroyedShips := 0 
    
    
OPERATIONS
    /*Main Operations*/
    
    // Deploy fleet for Player 1
    report <-- Player1_DeployFleet =
    PRE
        report : REPORT &
    END;
    

    
    // Deploy fleet for Player 2
    report <-- Player2_DeployFleet =
    PRE
        report : REPORT &
    THEN
        IF
    END;
        
    // Shooting operation for Player 1
    report <-- Player1_ShootsAt =
    PRE
        report : REPORT &
    THEN
        IF
    END;
        
    // Shooting operation for Player 2
    report <-- Player2_DeployFleet =
    PRE
        report : REPORT &
    THEN
        IF
    END;

    
    
    /*Enquiry Operations*/
    
    // Locate ships left in fleet
    shipsquares <-- LocationOfShips =
    PRE 
        x := 1;
        y := 1;
    WHILE x < 10 || y < 10 do
        if x < 10 THEN
        x := x + 1
    ELSE
        x := 0;
        y := y + 1
        END
    
    END;
    
    
    // Number of ships left in the fleet
    shipsCount <-- ShipsLeft =
    BEGIN
        shipsCount := number
    END;
    
    
    // Number of shots taken
    shotCount <-- ShotsTaken =
    BEGIN
        shotCount := numberOfShots
    END;
        
    
    // Report if the game is over
    status <-- GameStatus =
    PRE
        status: GAME_STATUS
    THEN
        IF
            shipsCount := 0
         THEN
             status := GameOver
         END
     END;
       

END
