local CorePackages = game:GetService("CorePackages")
local AppStorageService = game:GetService("AppStorageService")
local PromiseModule = require(CorePackages.Packages.Promise)
local ReactModule = require(CorePackages.Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.LuaApp.Constants)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GameDetailNotificationsButtonHintModule = require(Modules.LuaApp.Components.GameDetails.GameDetailNotificationsButtonHint)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local GetFFlagLuaAppEnableNotificationsEDPTooltipModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppEnableNotificationsEDPTooltip)
local GetFIntNotificationsEDPTooltipTimeLimitModule = require(Modules.LuaApp.Flags.GetFIntNotificationsEDPTooltipTimeLimit)
local IconsCommonNotificationOn = Images["icons/common/notificationOn"]
local IconsCommonNotificationOff = Images["icons/common/notificationOff"]

return function(p1)
	-- upvalues: GetFFlagLuaAppEnableNotificationsEDPTooltipModule (copy), AppStorageService (copy), ReactModule (copy), PromiseModule (copy), GetFIntNotificationsEDPTooltipTimeLimitModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), IconButton (copy), IconsCommonNotificationOn (copy), IconsCommonNotificationOff (copy), IconSize (copy), GameDetailNotificationsButtonHintModule (copy), TooltipOrientation (copy)
	local IsActive = nil
	local UseStateResult2 = nil
	local UseResult = nil
	local UseResult1 = nil
	
	if GetFFlagLuaAppEnableNotificationsEDPTooltipModule() then
		local function _(): boolean
			-- upvalues: AppStorageService (upval)
			local Success, Result = pcall(function()
				-- upvalues: AppStorageService (upval)
				return AppStorageService:GetItem("ShowNotificationsOptInTooltip")
			end)
			
			return if Success then Result == "true" else false
		end
		
		local UseRefFunction = ReactModule.useRef
		local Success, Result = pcall(function()
			-- upvalues: AppStorageService (upval)
			return AppStorageService:GetItem("ShowNotificationsOptInTooltip")
		end)
		local UseRefResult = UseRefFunction(if Success then Result == "true" else false)
		IsActive, UseStateResult2 = ReactModule.useState(UseRefResult.current)
		local UseStateResult, UseStateResult2_1 = ReactModule.useState(false)
		
		local _ = function()
			-- upvalues: UseStateResult2 (ref), UseStateResult2_1 (copy)
			UseStateResult2(false)
			UseStateResult2_1(true)
		end
		
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), AppStorageService (upval), PromiseModule (upval), GetFIntNotificationsEDPTooltipTimeLimitModule (upval), UseStateResult2 (ref), UseStateResult2_1 (copy)
			if UseRefResult.current then
				AppStorageService:SetItem("ShowNotificationsOptInTooltip", "false")
				AppStorageService:Flush()
			end
			PromiseModule.delay(GetFIntNotificationsEDPTooltipTimeLimitModule()):andThen(function()
				-- upvalues: UseStateResult2 (upval), UseStateResult2_1 (upval)
				UseStateResult2(false)
				UseStateResult2_1(true)
			end)
		end, {})
		local UseSelectorResult = UseSelectorFunction(function(p2)
			return p2.TopBar.statusBarHeight
		end)
		UseResult1 = ReactModule.useCallback(function(Frame)
			-- upvalues: UseRefResult (copy), UseSelectorResult (copy), ConstantsModule (upval), UseStateResult2 (ref), UseStateResult (copy)
			if Frame ~= nil and UseRefResult.current then
				if Frame.AbsolutePosition.Y < UseSelectorResult + ConstantsModule.NAV_BAR_SIZE then
					UseStateResult2(false)
					
					return
				end
				if not UseStateResult then
					UseStateResult2(true)
				end
			end
		end, { UseStateResult })
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (ref), UseStateResult2_1 (copy), p1 (copy)
			UseStateResult2(false)
			UseStateResult2_1(true)
			
			if p1.toggleFollowExperience then
				p1.toggleFollowExperience()
			end
		end, {})
	end
	local IsFollowed = p1.gameFollowings and p1.gameFollowings.isFollowed
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = if GetFFlagLuaAppEnableNotificationsEDPTooltipModule() then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Position = p1.position,
		AnchorPoint = p1.anchorPoint
	}, {
		IconButton = ReactModule.createElement(IconButton, {
			icon = if IsFollowed then IconsCommonNotificationOn else IconsCommonNotificationOff,
			iconSize = IconSize.Medium,
			onActivated = if GetFFlagLuaAppEnableNotificationsEDPTooltipModule() then UseResult else p1.toggleFollowExperience
		}, {
			Tooltip = if GetFFlagLuaAppEnableNotificationsEDPTooltipModule() then ReactModule.createElement(GameDetailNotificationsButtonHintModule, {
				onPositionChanged = UseResult1,
				isActive = IsActive,
				preferredOrientation = TooltipOrientation.Top
			}) else nil
		})
	})
end