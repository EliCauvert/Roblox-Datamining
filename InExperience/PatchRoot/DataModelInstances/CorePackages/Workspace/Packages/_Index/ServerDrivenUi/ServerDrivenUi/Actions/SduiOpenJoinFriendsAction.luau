local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, p3)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), setCentralOverlay (ref), centralOverlayType (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenJoinFriends
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local placeId = var1.placeId
	
	if placeId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "placeId",
			name = sduiActionType.OpenJoinFriends,
			message = `Missing placeId: {placeId}`
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId
	
	if universeId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = sduiActionType.OpenJoinFriends,
			message = `Missing universeId: {universeId}`
		}, p2.appPage)
		
		return
	elseif p3 then
		p2.dependencies.dispatch(setCentralOverlay(centralOverlayType.PlacesList, {
			game = {
				placeId = tostring(placeId),
				universeId = tostring(universeId)
			},
			anchorSpaceSize = p3.AbsoluteSize,
			anchorSpacePosition = p3.AbsolutePosition
		}))
		
		return
	end
	p2.dependencies.logger.reportError(sduiErrorType.FailedToExecuteAction, {
		message = "Failed to execute -- missing guiObject anchor",
		name = sduiActionType.OpenJoinFriends
	}, p2.appPage)
end