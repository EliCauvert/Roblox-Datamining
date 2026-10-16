local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local FoundationModule = require(CorePackages.Packages.Foundation)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local _ = require(Chrome.ChromeShared.Service.ChromeUtils)
local SubMenuContextModule = require(Chrome.ChromeShared.Unibar.SubMenuContext)
local IconVariant = FoundationModule.Enums.IconVariant
local IconSize = FoundationModule.Enums.IconSize
local IconName = FoundationModule.Enums.IconName
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local UseMappedSignalFunction = ChromeModule.Hooks.useMappedSignal
local UnibarStyle = ChromeModule.UnibarStyle

local function _(p1): boolean --[[ Line: 27 | Named "isFoundationIconName" ]]
	-- upvalues: IconName (copy)
	return IconName[p1] ~= nil
end

function CommonIconComponent(p1) --[[ Line: 33 ]]
	-- upvalues: FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), UseMappedSignalFunction (copy), UseStyleFunction (copy), ReactModule (copy), SubMenuContextModule (copy), IconName (copy), FoundationModule (copy), IconSize (copy), IconVariant (copy), Images (copy), ImageSetLabel (copy)
	local ICONSIZE = if FFlagTokenizeUnibarConstantsWithStyleProvider then UnibarStyle.use().ICON_SIZE else ConstantsModule.ICON_SIZE
	local UseMappedSignalResult = p1.activeSignalValue and UseMappedSignalFunction(p1.activeSignalValue) or false
	local IconOn = if UseMappedSignalResult and p1.iconOn then p1.iconOn else p1.icon
	local UseStyleResult = UseStyleFunction()
	local UseContextResult = ReactModule.useContext(SubMenuContextModule)
	local Color = UseStyleResult.Theme.IconEmphasis.Color
	local Transparency = UseStyleResult.Theme.IconEmphasis.Transparency
	
	if IconName[p1.icon] ~= nil then
		return ReactModule.createElement(FoundationModule.Icon, {
			name = IconName[p1.icon],
			size = IconSize.Large,
			style = if UseContextResult then UseContextResult:map(function(p2: number) --[[ Line: 56 ]]
				-- upvalues: Color (copy), Transparency (copy)
				return {
					Color3 = Color,
					Transparency = Transparency + (1 - Transparency) * (1 - p2)
				}
			end) else { Color3 = Color, Transparency = Transparency },
			variant = if UseMappedSignalResult then IconVariant.Filled else IconVariant.Regular
		})
	end
	if typeof(IconOn) == "string" and IconOn:sub(1, 11) ~= "rbxasset://" then
		IconOn = Images[IconOn]
	end
	return ReactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		Image = IconOn,
		Size = UDim2.new(0, ICONSIZE, 0, ICONSIZE),
		ImageColor3 = Color,
		ImageTransparency = if UseContextResult then UseContextResult:map(function(p2: number): number --[[ Line: 87 ]]
			-- upvalues: Transparency (copy)
			return Transparency + (1 - Transparency) * (1 - p2)
		end) else Transparency
	})
end

function CommonIcon(Icon, IconOn, ActiveSignalValue) --[[ Line: 94 ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement(CommonIconComponent, {
		icon = Icon,
		iconOn = IconOn,
		activeSignalValue = ActiveSignalValue
	})
end

return CommonIcon