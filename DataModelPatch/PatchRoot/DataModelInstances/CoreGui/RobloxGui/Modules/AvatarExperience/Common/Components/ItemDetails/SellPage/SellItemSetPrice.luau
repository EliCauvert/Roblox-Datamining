local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local IconTextBoxModule = require(Modules.AvatarExperience.Catalog.Components.IconTextBox)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local GetFFlagL2ControllerSupportModule = require(Modules.AvatarExperience.Flags.GetFFlagL2ControllerSupport)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconsCommonRobux = UIBloxModule.App.ImageSet.Images["icons/common/robux"]

local function _(p1, p2): boolean
	if p1 then
		local Number: number? = tonumber(p1)
		
		return not Number or Number <= (p2 or 0)
	else
		return true
	end
end

return (ReactModule.forwardRef(function(Gui, p1)
	-- upvalues: UseLocalizationModule (copy), UseStyleFunction (copy), ReactModule (copy), Focusable (copy), IconTextBoxModule (copy), IconsCommonRobux (copy), GetFFlagL2ControllerSupportModule (copy)
	local UseLocalizationModuleResult = UseLocalizationModule({
		setPriceLabel = "Feature.Catalog.Heading.SetPrice",
		pricePlaceholderText = "Feature.Catalog.Label.Price",
		minAmountText = "Feature.Catalog.Label.MinimumAmount",
		minAmountTextWithPrice = "Feature.Catalog.Label.MinimumAmountCustom"
	})
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local SubHeader1 = UseStyleResultFont.SubHeader1
	local CaptionBody = UseStyleResultFont.CaptionBody
	local BaseSize = UseStyleResultFont.BaseSize
	local ScaledRelativeSize = CaptionBody.RelativeSize * BaseSize
	local MinimumAmount = if Gui.priceFloor and Gui.priceFloor > 0 then UseLocalizationModuleResult.minAmountTextWithPrice:gsub("{minimumAmount}", (tostring(Gui.priceFloor))) else UseLocalizationModuleResult.minAmountText
	local CreateElementFunction = ReactModule.createElement
	local v1 = "Frame"
	local config = {
		BackgroundTransparency = 1,
		LayoutOrder = Gui.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0)
	}
	local config1 = {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 10)
		}),
		SetPriceSubHeader = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			TextWrapped = true,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = UseLocalizationModuleResult.setPriceLabel,
			Font = SubHeader1.Font,
			Size = UDim2.fromScale(1, 0),
			TextSize = SubHeader1.RelativeSize * BaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Theme.TextEmphasis.Color,
			TextTransparency = Theme.TextEmphasis.Transparency
		}),
		PriceInputBox = ReactModule.createElement(Focusable[IconTextBoxModule], {
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 0),
			PlaceholderText = UseLocalizationModuleResult.pricePlaceholderText,
			Image = IconsCommonRobux,
			TextInputType = Enum.TextInputType.Number,
			ref = if GetFFlagL2ControllerSupportModule() then p1 else nil,
			NextSelectionUp = if GetFFlagL2ControllerSupportModule() then Gui.NextSelectionUp else nil,
			NextSelectionDown = if GetFFlagL2ControllerSupportModule() then Gui.NextSelectionDown else nil,
			NextSelectionLeft = if GetFFlagL2ControllerSupportModule() then Gui.NextSelectionLeft else nil,
			NextSelectionRight = if GetFFlagL2ControllerSupportModule() then Gui.NextSelectionRight else nil,
			[ReactModule.Change.Text] = function(p2)
				-- upvalues: Gui (copy)
				local Text: string = p2.Text
				
				if string.len(Text) > 10 then
					p2.Text = Gui.priceInRobux
					
					return
				end
				if Text == nil or Text == "" then
					Gui.setPriceInRobux("")
					
					return
				end
				if string.match(Text, "^[0-9]+$") then
					Gui.setPriceInRobux(Text)
					
					return
				else
					p2.Text = Gui.priceInRobux
				end
			end
		})
	}
	local CreateElementFunction1 = ReactModule.createElement
	local v2 = "Frame"
	local config2 = {
		LayoutOrder = 3,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, ScaledRelativeSize + 2)
	}
	local t = {}
	local PriceInRobux = Gui.priceInRobux
	local PriceFloor = Gui.priceFloor
	local NoNumber = nil
	
	if PriceInRobux then
		local Number: number? = tonumber(PriceInRobux)
		NoNumber = not Number or Number <= (PriceFloor or 0)
	else
		NoNumber = true
	end
	if NoNumber then
		NoNumber = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			TextWrapped = true,
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = MinimumAmount,
			Font = CaptionBody.Font,
			Size = UDim2.fromScale(1, 0),
			TextSize = ScaledRelativeSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextColor3 = Theme.TextDefault.Color,
			TextTransparency = Theme.TextDefault.Transparency
		})
	end
	t.MinAmountText = NoNumber
	config1.MinAmountContainer = CreateElementFunction1(v2, config2, t)
	
	return CreateElementFunction(v1, config, config1)
end))