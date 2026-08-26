local parent = script:FindFirstAncestor("DataHydration").Parent
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local enumIgrsRating = require(parent.DiscoveryTypes).EnumIgrsRating
local t = {
	[enumIgrsRating.IgrsThirteenPlus] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-13.png",
	[enumIgrsRating.IgrsFifteenPlus] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-15.png",
	[enumIgrsRating.IgrsEighteenPlus] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-18.png",
	[enumIgrsRating.IgrsUnrated] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-pending.png"
}

if require(parent.SharedFlags).FFlagLuaAppAddIgrsImages then
	if enumIgrsRating.IgrsThreePlus then
		t[enumIgrsRating.IgrsThreePlus] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-3.png"
	end
	if enumIgrsRating.IgrsSevenPlus then
		t[enumIgrsRating.IgrsSevenPlus] = "rbxasset://textures/ui/LuaApp/icons/GameDetails/contentRating/igrs-7.png"
	end
end
return {
	getIgrsImage = function(p1)
		-- upvalues: t (ref), discoveryEventErrorLogger (ref)
		if t[p1] then
			return t[p1]
		end
		discoveryEventErrorLogger.reportError("getIgrsImage", `Invalid IGRS rating: {p1}`)
		
		return nil
	end
}