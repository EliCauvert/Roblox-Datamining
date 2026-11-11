local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ReactModule = require(CorePackages.Packages.React)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local ItemViewportUtilsModule = require(script.Parent.ItemViewportUtils)
local UseItemViewportInteractionsModule = require(script.Parent.useItemViewportInteractions)
local GetFFlagAXFixItemViewportErrorsModule = require(Modules.AvatarExperience.Flags.GetFFlagAXFixItemViewportErrors)
local GetFFlagAXSupportShoesInItemViewportModule = require(Modules.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport)
local _Color3 = Color3.fromRGB(218, 203, 173)

return function(p1)
	-- upvalues: ReactModule (copy), UseItemViewportInteractionsModule (copy), GetFFlagAXSupportShoesInItemViewportModule (copy), HttpService (copy), ConstantsModule (copy), ItemViewportUtilsModule (copy), SendAXCounterV2Function (copy), GetFFlagAXFixItemViewportErrorsModule (copy), MutedErrorModule (copy), _Color3 (copy), Loading (copy), IconSize (copy), ExternalEventConnection (copy), UserInputService (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef("")
	local UseRefResult4 = ReactModule.useRef(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local NoUseStateResult = not UseStateResult
	local UseItemViewportInteractionsModuleResult = UseItemViewportInteractionsModule({
		setParentScrollingEnabled = p1.setParentScrollingEnabled,
		defaultCameraDistanceRef = UseRefResult4
	})
	local UseResult = ReactModule.useCallback(if GetFFlagAXSupportShoesInItemViewportModule() then function(p2, Asset, DynamicHead, p3)
		-- upvalues: UseStateResult2 (copy), UseRefResult (copy), HttpService (upval), UseRefResult3 (copy), ConstantsModule (upval), ItemViewportUtilsModule (upval), p1 (copy), SendAXCounterV2Function (upval), GetFFlagAXFixItemViewportErrorsModule (upval), MutedErrorModule (upval), UseRefResult1 (copy), UseRefResult4 (copy)
		UseStateResult2(true)
		
		if UseRefResult.current then
			UseRefResult.current:ClearAllChildren()
		end
		local Guid = HttpService:GenerateGUID(false)
		UseRefResult3.current = Guid
		local Success, Result = pcall(function()
			-- upvalues: Asset (copy), ConstantsModule (upval), p2 (copy), ItemViewportUtilsModule (upval), DynamicHead (copy), p3 (copy)
			return if Asset == ConstantsModule.ItemType.Asset and tonumber(p2) then ItemViewportUtilsModule.getAssetModel((tonumber(p2))) elseif Asset == ConstantsModule.ItemType.Bundle and DynamicHead and p3 then if DynamicHead == ConstantsModule.BundleTypeIdStrings.Shoes then ItemViewportUtilsModule.getShoesModel(p3) else ItemViewportUtilsModule.getAvatarModel(p3, DynamicHead == ConstantsModule.BundleTypeIdStrings.DynamicHead) else nil
		end)
		
		if not Success or not Result then
			if p1.onLoadingFailed then
				p1.onLoadingFailed()
			end
			SendAXCounterV2Function("ItemViewportLoadingFailed")
			
			if not _G.__TESTEZ_RUNNING_TEST__ then
				warn(`ItemViewport: failed to load 3D model for item {p2}`, Result)
				
				if not GetFFlagAXFixItemViewportErrorsModule() then
					MutedErrorModule(`ItemViewport: failed to load 3D model. itemId:{p2} itemType:{Asset}`)
				end
			end
			return
		elseif UseRefResult3.current == Guid then
			UseRefResult4.current = ItemViewportUtilsModule.getCameraDistance(Result, if UseRefResult1.current then UseRefResult1.current.MaxAxisFieldOfView else 70)
			Result.Parent = UseRefResult.current
			UseStateResult2(false)
			
			return
		else
			Result:Destroy()
		end
	end else function(p4, Asset, p5, p6)
		-- upvalues: UseStateResult2 (copy), UseRefResult (copy), HttpService (upval), UseRefResult3 (copy), ConstantsModule (upval), ItemViewportUtilsModule (upval), p1 (copy), SendAXCounterV2Function (upval), GetFFlagAXFixItemViewportErrorsModule (upval), MutedErrorModule (upval), UseRefResult1 (copy), UseRefResult4 (copy)
		UseStateResult2(true)
		
		if UseRefResult.current then
			UseRefResult.current:ClearAllChildren()
		end
		local Guid = HttpService:GenerateGUID(false)
		UseRefResult3.current = Guid
		local Success, Result = pcall(function()
			-- upvalues: Asset (copy), ConstantsModule (upval), p4 (copy), ItemViewportUtilsModule (upval), p5 (copy), p6 (copy)
			return if Asset == ConstantsModule.ItemType.Asset and tonumber(p4) then ItemViewportUtilsModule.getAssetModel((tonumber(p4))) elseif Asset == ConstantsModule.ItemType.Bundle and p5 and p6 and tonumber(p6) then ItemViewportUtilsModule.getBundleModel(p5, (tonumber(p6))) else nil
		end)
		
		if not Success or not Result then
			if p1.onLoadingFailed then
				p1.onLoadingFailed()
			end
			SendAXCounterV2Function("ItemViewportLoadingFailed")
			
			if not _G.__TESTEZ_RUNNING_TEST__ then
				warn(`ItemViewport: failed to load 3D model for item {p4}`, Result)
				
				if not GetFFlagAXFixItemViewportErrorsModule() then
					MutedErrorModule(`ItemViewport: failed to load 3D model. itemId:{p4} itemType:{Asset}`)
				end
			end
			return
		elseif UseRefResult3.current == Guid then
			UseRefResult4.current = ItemViewportUtilsModule.getCameraDistance(Result, if UseRefResult1.current then UseRefResult1.current.MaxAxisFieldOfView else 70)
			Result.Parent = UseRefResult.current
			UseStateResult2(false)
			
			return
		else
			Result:Destroy()
		end
	end, { p1.onLoadingFailed })
	
	if GetFFlagAXSupportShoesInItemViewportModule() then
		ReactModule.useEffect(function()
			-- upvalues: UseResult (copy), p1 (copy)
			task.spawn(function()
				-- upvalues: UseResult (upval), p1 (upval)
				UseResult(p1.itemId, p1.itemType, p1.bundleType, p1.bundleItems)
			end)
		end, {
			p1.itemId,
			p1.itemType,
			p1.bundleType,
			p1.bundleItems,
			UseResult
		})
	else
		ReactModule.useEffect(function()
			-- upvalues: UseResult (copy), p1 (copy)
			task.spawn(function()
				-- upvalues: UseResult (upval), p1 (upval)
				UseResult(p1.itemId, p1.itemType, p1.bundleType, p1.outfitId)
			end)
		end, {
			p1.itemId,
			p1.itemType,
			p1.bundleType,
			p1.outfitId,
			UseResult
		})
	end
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy)
		if UseRefResult2.current then
			UseRefResult2.current.CurrentCamera = UseRefResult1.current
		end
	end, {})
	
	return ReactModule.createElement("ViewportFrame", {
		Size = p1.size or UDim2.fromScale(1, 1),
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		LightColor = _Color3,
		LightDirection = vector.create(-1, -1, 2),
		BackgroundTransparency = 1,
		ref = UseRefResult2,
		[ReactModule.Event.InputBegan] = if NoUseStateResult then UseItemViewportInteractionsModuleResult.onInputBegan else nil,
		[ReactModule.Event.MouseWheelForward] = if NoUseStateResult then UseItemViewportInteractionsModuleResult.onMouseWheelForward else nil,
		[ReactModule.Event.MouseWheelBackward] = if NoUseStateResult then UseItemViewportInteractionsModuleResult.onMouseWheelBackward else nil,
		[ReactModule.Event.MouseEnter] = if NoUseStateResult then UseItemViewportInteractionsModuleResult.onMouseEnter else nil,
		[ReactModule.Event.MouseLeave] = if NoUseStateResult then UseItemViewportInteractionsModuleResult.onMouseLeave else nil
	}, {
		WorldModel = ReactModule.createElement("WorldModel", { ref = UseRefResult }),
		Camera = ReactModule.createElement("Camera", {
			CameraType = Enum.CameraType.Scriptable,
			CFrame = UseItemViewportInteractionsModuleResult.cameraCFrame,
			ref = UseRefResult1
		}),
		LoadingSpinner = if UseStateResult then ReactModule.createElement(Loading, {
			Position = UDim2.fromScale(0.5, 0.5),
			size = IconSize.Large,
			AnchorPoint = Vector2.new(0.5, 0.5)
		}) else nil,
		InputChangedConnection = if NoUseStateResult then ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService.InputChanged,
			callback = UseItemViewportInteractionsModuleResult.onInputChanged
		}) else nil,
		InputEndedConnection = if NoUseStateResult then ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService.InputEnded,
			callback = UseItemViewportInteractionsModuleResult.onInputEnded
		}) else nil,
		TouchPinchConnection = if NoUseStateResult then ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService.TouchPinch,
			callback = UseItemViewportInteractionsModuleResult.onTouchPinch
		}) else nil
	})
end