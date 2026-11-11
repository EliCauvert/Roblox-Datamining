local CorePackages = game:GetService("CorePackages")
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local GamePlayButtonModule = require(CorePackages.Workspace.Packages.GamePlayButton)
local OtterModule = require(CorePackages.Packages.Otter)
local ReactModule = require(CorePackages.Packages.React)
local RobloxAppHooksModule = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FFlagEnablePrivatePartyStartJoin = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePrivatePartyStartJoin
local UseDeviceOrientationFunction = RobloxAppHooksModule.useDeviceOrientation
local UseScreenSizeFunction = RobloxAppHooksModule.useScreenSize
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local PlayButtonStates = GamePlayButtonModule.PlayButtonStates
local UseOnPlayButtonCallbackFunction = GamePlayButtonModule.useOnPlayButtonCallback

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), FFlagEnablePrivatePartyStartJoin (copy), UseOnPlayButtonCallbackFunction (copy), UseScreenSizeFunction (copy), UseDeviceOrientationFunction (copy), DeviceOrientationMode (copy), MenuDirection (copy), MutedErrorFunction (copy), ReactModule (copy), CloseCentralOverlayFunction (copy), PlayButtonStates (copy), ContextualMenu (copy), OtterModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		soloPlay = "Feature.Squads.Label.SoloPlay",
		joinWithPrivateParty = if FFlagEnablePrivatePartyStartJoin then "Feature.Squads.Action.JoinWithPrivateParty" else nil
	})
	local SquadContextualMenu = UseOnPlayButtonCallbackFunction(p1.universeId, p1.referralSource, "SquadContextualMenu", nil, nil, nil, nil)
	local SquadContextualMenu1 = UseOnPlayButtonCallbackFunction(p1.universeId, p1.referralSource, "SquadContextualMenu", nil, nil, { joinAttemptOrigin = "SquadJoinSoloButton" }, nil)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseDeviceOrientationResult = UseDeviceOrientationFunction() or DeviceOrientationMode.Portrait
	local MenuDirection1 = nil
	local Position: UDim2? = nil
	local Size: UDim2? = nil
	
	if UseDeviceOrientationResult == DeviceOrientationMode.Landscape then
		if p1.landscapeMenuDirection == MenuDirection.Up then
			Position = UDim2.fromOffset(p1.menuAnchorPosition.X + p1.menuAnchorSize.X - 250, p1.menuAnchorPosition.Y - 12)
		elseif p1.landscapeMenuDirection == MenuDirection.Down then
			Position = UDim2.fromOffset(p1.menuAnchorPosition.X + p1.menuAnchorSize.X - 250, p1.menuAnchorPosition.Y + p1.menuAnchorSize.Y + 12)
		else
			MutedErrorFunction(`Squad contextual menu received unsupported menu direction: {p1.landscapeMenuDirection}`)
		end
		MenuDirection1 = p1.landscapeMenuDirection
		Size = UDim2.new(0, 250, 1, 0)
	elseif UseDeviceOrientationResult == DeviceOrientationMode.Portrait then
		MenuDirection1 = MenuDirection.Up
		Position = UDim2.fromOffset(0, 0)
		Size = UDim2.fromScale(1, 1)
	else
		MutedErrorFunction(`Squad contextual menu received unsupported device orientation: {UseDeviceOrientationResult}`)
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
		UseDispatchResult(CloseCentralOverlayFunction())
	end, { UseDispatchResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy), SquadContextualMenu (copy), PlayButtonStates (upval), UseResult (copy), FFlagEnablePrivatePartyStartJoin (upval), SquadContextualMenu1 (copy)
		local List = {}
		table.insert(List, {
			text = UseLocalizationResult.joinWithParty,
			onActivated = function()
				-- upvalues: SquadContextualMenu (upval), PlayButtonStates (upval), UseResult (upval)
				SquadContextualMenu(PlayButtonStates.PlayableWithParty)
				UseResult()
			end
		})
		
		if FFlagEnablePrivatePartyStartJoin then
			table.insert(List, {
				text = UseLocalizationResult.joinWithPrivateParty,
				onActivated = function()
					-- upvalues: SquadContextualMenu (upval), PlayButtonStates (upval), UseResult (upval)
					SquadContextualMenu(PlayButtonStates.PlayableWithParty, nil, { isPrivateParty = true })
					UseResult()
				end
			})
		end
		table.insert(List, {
			text = UseLocalizationResult.soloPlay,
			onActivated = function()
				-- upvalues: SquadContextualMenu1 (upval), PlayButtonStates (upval), UseResult (upval)
				SquadContextualMenu1(PlayButtonStates.Playable)
				UseResult()
			end
		})
		
		return List
	end, {
		UseLocalizationResult.soloPlay, UseLocalizationResult.joinWithParty,
		if FFlagEnablePrivatePartyStartJoin then UseLocalizationResult.joinWithPrivateParty else nil,
		UseResult, SquadContextualMenu1, SquadContextualMenu
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = Position,
		Size = Size
	}, {
		ContextMenu = ReactModule.useMemo(function()
			-- upvalues: UseDeviceOrientationResult (copy), DeviceOrientationMode (upval), ReactModule (upval), ContextualMenu (upval), UseMemoResult (copy), MenuDirection1 (ref), OtterModule (upval), UseResult (copy), UseScreenSizeResult (copy)
			return if UseDeviceOrientationResult == DeviceOrientationMode.Landscape then ReactModule.createElement(ContextualMenu, {
				closeBackgroundVisible = false,
				open = true,
				showDropShadow = true,
				buttonProps = UseMemoResult,
				contextMenuWidthOverride = UDim.new(1, 0),
				horizontalAlignment = Enum.HorizontalAlignment.Left,
				menuDirection = MenuDirection1,
				motorOverrideOptions = {
					motorCallback = OtterModule.instant,
					open = { targetValue = 1 },
					close = { targetValue = 0 }
				},
				onDismiss = UseResult,
				openPositionY = UDim.new(0, 0),
				screenSize = UseScreenSizeResult
			}) else ReactModule.createElement(ContextualMenu, {
				closeBackgroundVisible = false,
				open = true,
				showDropShadow = true,
				buttonProps = UseMemoResult,
				menuDirection = MenuDirection1,
				onDismiss = UseResult,
				openPositionY = UDim.new(1, -76),
				screenSize = UseScreenSizeResult
			})
		end, {
			UseMemoResult,
			UseDeviceOrientationResult,
			MenuDirection1,
			UseResult,
			UseScreenSizeResult
		})
	})
end