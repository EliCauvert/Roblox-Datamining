local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local openSongDetail = require(parent.DiscoveryRouting).OpenSongDetail
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), openSongDetail (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenSongDetail
		}, p1.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local songId = var1.songId
	
	if typeof(songId) == "string" and songId ~= "" then
		p1.dependencies.dispatch(openSongDetail(songId))
		
		return
	end
	p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
		propName = "songId",
		name = sduiActionType.OpenSongDetail,
		message = `Invalid or missing songId: {songId}`
	}, p1.appPage)
end