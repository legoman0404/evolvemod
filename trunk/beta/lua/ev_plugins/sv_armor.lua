/*-------------------------------------------------------------------------------------------------------------------------
	Set the armor of a player
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = { }
PLUGIN.Title = "Armor"
PLUGIN.Description = "Set the armor of a player."
PLUGIN.Author = "Overv"
PLUGIN.ChatCommand = "armor"
PLUGIN.Usage = "<players> [armor]"

function PLUGIN:Call( ply, args )
	if ( ply:EV_IsAdmin( ) ) then
		local pls = evolve:findPlayer( evolve:filterNumber( args ), ply )
		if ( #pls > 0 and !pls[1]:IsValid( ) ) then pls = { } end
		local armor = 100
		if ( tonumber( args[ #args ] ) ) then armor = tonumber( args[ #args ] ) end
		
		for _, pl in pairs( pls ) do
			pl:SetArmor( armor )
		end
		
		if ( #pls > 0 ) then
			evolve:notify( evolve.colors.blue, ply:Nick( ), evolve.colors.white, " has set the armor of ", evolve.colors.red, evolve:createPlayerList( pls ), evolve.colors.white, " to " .. armor .. "." )
		else
			evolve:notify( ply, evolve.colors.red, "No matching players found." )
		end
	else
		evolve:notify( ply, evolve.colors.red, evolve.constants.notallowed )
	end
end

evolve:registerPlugin( PLUGIN )