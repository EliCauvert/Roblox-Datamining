local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetLibraryStoreModule = require(BuildExperience.Stores.GetLibraryStore)
local WorldTouchControlsViewModule = require(script.Parent.WorldTouchControlsView)
local _ = require(BuildExperience.WorldTouchControls.createWorldTouchInput)
local UseWorldTouchControlsViewModelModule = require(script.Parent.useWorldTouchControlsViewModel)

local function toRect(Frame: Frame)
	return if Frame == nil then nil else Rect.new(Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize)
end

local function getControlsArea(UseSignalStateResult, UseSignalStateResult1, UseSignalStateResult2, p1): Rect?
	if UseSignalStateResult == nil then
		return nil
	else
		local ZeroVector = if p1 == nil then Vector2.zero else p1.Min
		local Largest = math.max(UseSignalStateResult.Min.Y, if p1 == nil then -1e999 else p1.Min.Y)
		local Largest1 = math.max(UseSignalStateResult.Min.X, if p1 == nil then -1e999 else p1.Min.X)
		
		return Rect.new(Vector2.new(Largest1, Largest) - ZeroVector, Vector2.new(math.max(Largest1, (math.min(UseSignalStateResult.Max.X, UseSignalStateResult2 or 1e999, if p1 == nil then 1e999 else p1.Max.X))), (math.max(Largest, (math.min(UseSignalStateResult.Max.Y, UseSignalStateResult1 or 1e999, if p1 == nil then 1e999 else p1.Max.Y))))) - ZeroVector)
	end
end

local function useScreenRect(Frame: Frame)
	-- upvalues: ReactModule (copy), toRect (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if Frame == nil then nil else Rect.new(Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize))
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseStateResult2 (copy), toRect (upval)
		if Frame == nil then
			UseStateResult2(nil)
			
			return nil
		else
			local function update()
				-- upvalues: UseStateResult2 (upval), toRect (upval), Frame (upval)
				UseStateResult2(toRect(Frame))
			end
			
			UseStateResult2(toRect(Frame))
			local Connections = {
				Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(update),
				Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
			}
			
			return function()
				-- upvalues: Connections (copy)
				for _, connection in Connections do
					connection:Disconnect()
				end
			end
		end
	end, { Frame })
	
	return UseStateResult
end

return function(p1)
	-- upvalues: GetLibraryStoreModule (copy), SignalsReactModule (copy), useScreenRect (copy), UseWorldTouchControlsViewModelModule (copy), ReactModule (copy), FocusNavigationUtilsModule (copy), WorldTouchControlsViewModule (copy), getControlsArea (copy)
	local LibraryStoreModule = GetLibraryStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(LibraryStoreModule.getIsOpen)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(LibraryStoreModule.getWorldViewportRect)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(LibraryStoreModule.getWorldChatTop)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(LibraryStoreModule.getWorldChatLeft)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(LibraryStoreModule.getWorldCutoutTransitioning)
	local UseSignalStateResult5 = SignalsReactModule.useSignalState(LibraryStoreModule.getWorldCameraSettling)
	local UseScreenRectResult = useScreenRect(p1.screen)
	local UserInputService = p1.userInputService or game:GetService("UserInputService")
	local NoUseSignalStateResult5: boolean = not UseSignalStateResult and (UserInputService.TouchEnabled and (UseSignalStateResult1 ~= nil and (not UseSignalStateResult4 and not UseSignalStateResult5)))
	local UseWorldTouchControlsViewModelModuleResult = UseWorldTouchControlsViewModelModule({
		stickRadius = 56,
		touchInput = p1.touchInput,
		isVisible = NoUseSignalStateResult5,
		userInputService = p1.userInputService
	})
	
	return ReactModule.createElement(FocusNavigationUtilsModule.FocusRoot, {
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = NoUseSignalStateResult5
	}, {
		Controls = ReactModule.createElement(WorldTouchControlsViewModule, {
			stickRadius = 56,
			isVisible = NoUseSignalStateResult5,
			area = getControlsArea(UseSignalStateResult1, UseSignalStateResult2, UseSignalStateResult3, UseScreenRectResult),
			knobOffset = UseWorldTouchControlsViewModelModuleResult.knobOffset,
			opacity = UseWorldTouchControlsViewModelModuleResult.opacity,
			onStickInputBegan = UseWorldTouchControlsViewModelModuleResult.onStickInputBegan,
			onRaiseInputBegan = UseWorldTouchControlsViewModelModuleResult.onRaiseInputBegan,
			onLowerInputBegan = UseWorldTouchControlsViewModelModuleResult.onLowerInputBegan
		})
	})
end