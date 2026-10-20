local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local DropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseLicenseDataModule = require(Modules.LuaApp.Components.More.Licensing.useLicenseData)
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local ScrollBarType = UIBloxModule.App.Container.Enum.ScrollBarType
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local FocusFrameModule = require(Modules.LuaApp.Components.FocusFrame)
local MoreSectionModule = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreSection)
local BodyText = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreText).BodyText
local _ = require(script.Parent.Types)

local function useDropDownData()
	-- upvalues: UseLicenseDataModule (copy), ReactModule (copy), DashModule (copy)
	local UseLicenseDataModuleResult = UseLicenseDataModule()
	local LicenseList = UseLicenseDataModuleResult.licenseList
	local InitialLicenseKey = UseLicenseDataModuleResult.initialLicenseKey
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), LicenseList (copy)
		return DashModule.map(LicenseList, function(p1)
			return { text = p1.key }
		end)
	end, { LicenseList }), ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), LicenseList (copy), UseStateResult (copy), InitialLicenseKey (copy)
		local MapResult = DashModule.map(LicenseList, function(p1)
			return { key = p1.key, value = table.concat(p1.value, "\n") }
		end)
		
		return (DashModule.find(MapResult, function(p1): boolean
			-- upvalues: UseStateResult (upval), InitialLicenseKey (upval)
			return p1.key == (UseStateResult or InitialLicenseKey)
		end) or (MapResult[1] or { key = "", value = "" })).value
	end, { UseStateResult, LicenseList, InitialLicenseKey }), UseStateResult2
end

local function PanelContentWrapper(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), VerticalScrollView (copy), ScrollBarType (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), p1 (copy)
		if UseRefResult.current then
			for _, Gui in UseRefResult.current:GetDescendants() do
				if Gui:IsA("GuiObject") then
					if Gui == UseRefResult1.current and p1.selectable then
						Gui.Selectable = true
					else
						Gui.Selectable = false
					end
				end
			end
		end
	end)
	
	return ReactModule.createElement("Frame", {
		SelectionGroup = true,
		ref = UseRefResult,
		Position = UDim2.new(),
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseDesignTokensResult.Color.Surface.Surface_0.Color3,
		BackgroundTransparency = if p1.selectable then UseDesignTokensResult.Color.Surface.Surface_0.Transparency else 1,
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop
	}, ReactModule.createElement(VerticalScrollView, {
		useAutomaticCanvasSize = true,
		isGamepadFocusable = true,
		ref = UseRefResult1,
		canvasSizeY = UDim.new(),
		scrollingEnabled = p1.scrollingEnabled,
		scrollBarType = if p1.scrollingEnabled then ScrollBarType.Gamepad else nil
	}, p1.children))
end

local function renderPanel(ScrollingEnabled, Selectable, p2)
	-- upvalues: ReactModule (copy), PanelContentWrapper (copy)
	return ReactModule.createElement(PanelContentWrapper, {
		scrollingEnabled = ScrollingEnabled,
		selectable = Selectable
	}, p2)
end

return function(p2)
	-- upvalues: UseLocalizationFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), useDropDownData (copy), GetTextSizeFunction (copy), BodyText (copy), MoreSectionModule (copy), DropdownMenu (copy), FocusFrameModule (copy), renderPanel (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		noLicenses = "CommonUI.Messages.Message.NoLicenses",
		title = p2.titleKey
	})
	local UseDesignTokensResult = UseDesignTokensFunction()
	local LicensePanelWidthScale = UseDesignTokensResult.LuaApps.More.LicensePanelWidthScale
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local _UDim = UDim.new(0, UseDesignTokensResult.Size.Size_600)
	local ScrimColor3 = UseDesignTokensResult.Color.Common.Scrim.Color3
	local Transparency = UseDesignTokensResult.Color.Common.Scrim.Transparency
	local Surface0 = UseDesignTokensResult.Color.Surface.Surface_0
	local BodyLargeFont = UseDesignTokensResult.Typography.BodyLarge.Font
	local FontSize = UseDesignTokensResult.Typography.BodyLarge.FontSize
	local Size600 = UseDesignTokensResult.Size.Size_600
	local UseDropDownDataResult, UseDropDownDataResult2, UseDropDownDataResult3 = useDropDownData()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseDropDownDataResult2 (copy), GetTextSizeFunction (upval), FontSize (copy), BodyLargeFont (copy), UseStateResult (copy), Size600 (copy)
		return if UseDropDownDataResult2 then GetTextSizeFunction(UseDropDownDataResult2, FontSize, BodyLargeFont, Vector2.new(UseStateResult + Size600 * 2, 1e999)).Y else 0
	end, {
		UseDropDownDataResult2,
		FontSize,
		BodyLargeFont,
		UseStateResult,
		Size600
	})
	
	return ReactModule.createElement(MoreSectionModule, {
		layoutOrder = p2.layoutOrder,
		withDivider = p2.withDivider,
		title = UseLocalizationResult.title
	}, ReactModule.createElement("Frame", {
		Name = "LicenseDropdown",
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		ZIndex = 2,
		ref = ReactModule.useCallback(function(Frame)
			-- upvalues: UseStateResult2 (copy), LicensePanelWidthScale (copy)
			if Frame then
				UseStateResult2(Frame.AbsoluteSize.X * LicensePanelWidthScale)
			end
		end, {}),
		Size = UDim2.new(1, 0, 0, 72)
	}, ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, ReactModule.createElement(DropdownMenu, {
		placeholder = if #UseDropDownDataResult > 0 then UseDropDownDataResult[1].text else UseLocalizationResult.noLicenses,
		onChange = UseDropDownDataResult3,
		height = UDim.new(0, 72),
		screenSize = Vector2.new(1920, 1080),
		cellDatas = UseDropDownDataResult,
		menuListBackground = {
			Color = Surface0.Color3,
			Transparency = Surface0.Transparency
		}
	}))), ReactModule.createElement(FocusFrameModule, {
		layoutOrder = 2,
		limitInlineHeight = true,
		safeAreaSize = UDim2.new(1, -2 * UseDesignTokensResult.Size.Size_1600, 0, 3 * UseDesignTokensResult.Size.Size_2000),
		overlayColor3 = ScrimColor3,
		overlayTransparency = Transparency,
		renderContents = ReactModule.useCallback(function()
			-- upvalues: ReactModule (upval), LicensePanelWidthScale (copy), _UDim (copy), BodyText (upval), UseDropDownDataResult2 (copy), UseMemoResult (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.new(),
				Size = UDim2.fromScale(LicensePanelWidthScale, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, ReactModule.createElement("UIPadding", { PaddingTop = _UDim, PaddingBottom = _UDim }), ReactModule.createElement(BodyText, {
				layoutOrder = 2,
				text = UseDropDownDataResult2,
				size = UDim2.new(1, 0, 1, UseMemoResult),
				TextYAlignment = Enum.TextYAlignment.Top
			}))
		end, {
			UseDropDownDataResult2,
			UseMemoResult,
			_UDim,
			LicensePanelWidthScale
		}),
		renderContentWrapper = renderPanel
	}))
end