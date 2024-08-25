/* Player2_Grid
 * Author: Lind Zariqi
 */
MACHINE
    Player2_Grid
    
CONSTANTS
    gridX, gridY, grid, water, shipPiece, destroyedShipGrid
    
PROPERTIES
    // Main grid
    //grid <: NAT1 &
    //grid = 1..10 &
    gridX = 1..10 &
    gridY = 1..10 &
    grid = gridX * gridY &
    
    // Ship pieces
    shipPiece <: grid &
    //shipPiece = {1|->6, 6|->8, 8|->3} &
    
    // Water pieces/empty
    water <: grid &
    water /\ shipPiece = {} &
    water \/ shipPiece = grid &
    water /\ destroyedShipGrid = {} &
    water \/ destroyedShipGrid = grid &
    
    // Destroyed Ship pieces
    destroyedShipGrid <: grid 
    

END
