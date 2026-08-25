local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p0, _, p1, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), setCentralOverlay (ref), centralOverlayType (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenJoinFriends
		}, p1.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local placeId = var1.placeId
	
	if placeId == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "placeId",
			name = sduiActionType.OpenJoinFriends,
			message = `Missing placeId: {placeId}`
		}, p1.appPage)
		
		return
	end
	local universeId = var1.universeId
	
	if universeId == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = sduiActionType.OpenJoinFriends,
			message = `Missing universeId: {universeId}`
		}, p1.appPage)
		
		return
	elseif p2 then
		p1.dependencies.dispatch(setCentralOverlay(centralOverlayType.PlacesList, {
			game = {
				placeId = tostring(placeId),
				universeId = tostring(universeId)
			},
			anchorSpaceSize = p2.AbsoluteSize,
			anchorSpacePosition = p2.AbsolutePosition
		}))
		
		return
	end
	p1.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
		message = "Failed to execute -- missing guiObject anchor",
		name = sduiActionType.OpenJoinFriends
	}, p1.appPage)
end