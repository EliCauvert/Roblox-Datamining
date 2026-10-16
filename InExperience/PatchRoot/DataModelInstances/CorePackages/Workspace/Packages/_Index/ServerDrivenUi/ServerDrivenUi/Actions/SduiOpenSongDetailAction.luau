local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local OpenSongDetailFunction = require(Parent.DiscoveryRouting).OpenSongDetail
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, _) --[[ Line: 13 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), OpenSongDetailFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenSongDetail
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local SongId = ActionParams.songId
	
	if typeof(SongId) == "string" and SongId ~= "" then
		p2.dependencies.dispatch(OpenSongDetailFunction(SongId))
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "songId",
			name = SduiActionType.OpenSongDetail,
			message = `Invalid or missing songId: {SongId}`
		}, p2.appPage)
	end
end