local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

return function(p1, _, p2, Frame: Frame)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenJoinFriends
		}, p2.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local PlaceId = ActionParams.placeId
	
	if PlaceId == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "placeId",
			name = SduiActionType.OpenJoinFriends,
			message = `Missing placeId: {PlaceId}`
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if UniverseId == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "universeId",
			name = SduiActionType.OpenJoinFriends,
			message = `Missing universeId: {UniverseId}`
		}, p2.appPage)
		
		return
	end
	if Frame then
		p2.dependencies.dispatch(SetCentralOverlayFunction(CentralOverlayType.PlacesList, {
			game = {
				placeId = tostring(PlaceId),
				universeId = tostring(UniverseId)
			},
			anchorSpaceSize = Frame.AbsoluteSize,
			anchorSpacePosition = Frame.AbsolutePosition
		}))
		
		return
	else
		p2.dependencies.logger.reportError(SduiErrorType.FailedToExecuteAction, {
			message = "Failed to execute -- missing guiObject anchor",
			name = SduiActionType.OpenJoinFriends
		}, p2.appPage)
	end
end