local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local ImpressionsTagUtility = require(CorePackages.Workspace.Packages.Impressions).ImpressionsTagUtility
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local GetIconSizeFunction = UIBloxModule.App.ImageSet.getIconSize
local IconButton = UIBloxModule.App.Button.IconButton
local Medium = UIBloxModule.App.ImageSet.Enum.IconSize.Medium
local FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp

local function HandleItemClick() end

local LogoTray = RoactModule.Component:extend("LogoTray")
LogoTray.validateProps = TModule.strictInterface({
	itemList = TModule.array(TModule.strictInterface({
		key = TModule.string,
		logo = UIBloxModule.Core.ImageSet.Validator.validateImage
	})),
	layoutOrder = TModule.integer,
	padding = TModule.optional(TModule.UDim),
	handleItemClick = TModule.optional(TModule.callback),
	designTokens = TModule.table,
	impressionsTag = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then TModule.string else nil,
	onAbsolutePositionChanged = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then TModule.optional(TModule.callback) else nil,
	forwardRef = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then TModule.optional(TModule.table) else nil
})
LogoTray.defaultProps = {
	padding = UDim.new(0, 12),
	handleItemClick = HandleItemClick
}

function LogoTrayItem(p1)
	-- upvalues: ReactModule (copy), ImpressionsTagUtility (copy), RoactModule (copy), IconButton (copy), CryoModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult, p1.impressionsTag, p1.index)
		end
	end, { UseRefResult, p1.impressionsTag, p1.index })
	
	return RoactModule.createElement(IconButton, CryoModule.Dictionary.join(p1.iconButtonProps, { buttonRef = UseRefResult }))
end

function LogoTray.init(p1)
	-- upvalues: CryoModule (copy), GetIconSizeFunction (copy), Medium (copy), FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy), RoactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), IconButton (copy)
	function p1.getInteractableItemTable()
		-- upvalues: CryoModule (upval), p1 (copy)
		local t = {}
		CryoModule.List.map(p1.props.itemList, function(p2)
			-- upvalues: t (copy)
			assert(t[p2.key] == nil, "Duplicate logo key is not allowed.")
			t[p2.key] = p2
		end)
		
		return t
	end
	
	function p1.getMeasuredItemSize(): UDim2
		-- upvalues: GetIconSizeFunction (upval), Medium (upval)
		local IconSize = GetIconSizeFunction(Medium)
		
		return UDim2.fromOffset(IconSize, IconSize)
	end
	
	function p1.renderItem(p2)
		-- upvalues: CryoModule (upval), p1 (copy), FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (upval), RoactModule (upval), FFlagRenameDeprecatedUIBloxTokens (upval), Medium (upval), IconButton (upval)
		assert(p2.logo ~= nil, "Invalid icon: " .. p2.key)
		local FindResult = CryoModule.List.find(p1.props.itemList, p2)
		
		return if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then RoactModule.createElement(LogoTrayItem, {
			iconButtonProps = {
				icon = p2.logo,
				size = p1.getMeasuredItemSize(),
				iconColor3 = (if FFlagRenameDeprecatedUIBloxTokens then p1.props.designTokens.Color.Shift.Shift_400 else p1.props.designTokens.Semantic.Color.Ui.Emphasis).Color3,
				iconSize = Medium,
				onActivated = function()
					-- upvalues: p1 (upval), p2 (copy)
					p1.props.handleItemClick(p2.key)
				end,
				layoutOrder = FindResult
			},
			index = FindResult,
			impressionsTag = p1.props.impressionsTag
		}) else RoactModule.createElement(IconButton, {
			icon = p2.logo,
			size = p1.getMeasuredItemSize(),
			iconColor3 = (if FFlagRenameDeprecatedUIBloxTokens then p1.props.designTokens.Color.Shift.Shift_400 else p1.props.designTokens.Semantic.Color.Ui.Emphasis).Color3,
			iconSize = Medium,
			onActivated = function()
				-- upvalues: p1 (upval), p2 (copy)
				p1.props.handleItemClick(p2.key)
			end,
			layoutOrder = FindResult
		})
	end
	
	function p1:renderList()
		-- upvalues: p1 (copy), RoactModule (upval)
		local RenderItemResults = {}
		
		for _, value in p1.getInteractableItemTable() do
			RenderItemResults[value.key] = p1.renderItem(value)
		end
		RenderItemResults.Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = p1.props.padding,
			HorizontalAlignment = Enum.HorizontalAlignment.Left
		})
		
		return RenderItemResults
	end
end

function LogoTray.render(p2)
	-- upvalues: RoactModule (copy), FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp (copy)
	local MeasuredItemSize = p2.getMeasuredItemSize()
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, MeasuredItemSize.Y.Offset),
		LayoutOrder = p2.props.layoutOrder,
		[RoactModule.Change.AbsolutePosition] = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then p2.props.onAbsolutePositionChanged else nil,
		[RoactModule.Ref] = if FFlagLuaAppAddSocialLinkImpressionsTelemetryToEdp then p2.props.forwardRef else nil
	}, p2.renderList(MeasuredItemSize))
end

return function(p2)
	-- upvalues: UseDesignTokens (copy), CryoModule (copy), RoactModule (copy), LogoTray (copy)
	return RoactModule.createElement(LogoTray, (CryoModule.Dictionary.join(p2, { designTokens = UseDesignTokens() })))
end