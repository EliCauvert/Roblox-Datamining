local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local foundationModule = require(corePackagesService.Packages.Foundation)
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local _ = require(chrome.ChromeShared.Service.ChromeUtils)
local subMenuContextModule = require(chrome.ChromeShared.Unibar.SubMenuContext)
local iconVariant = foundationModule.Enums.IconVariant
local iconSize = foundationModule.Enums.IconSize
local iconName = foundationModule.Enums.IconName
local fFlagTokenizeUnibarConstantsWithStyleProvider = require(chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local useMappedSignal = chromeModule.Hooks.useMappedSignal
local unibarStyle = chromeModule.UnibarStyle

local function _(p1)
	-- upvalues: iconName (ref)
	return iconName[p1] ~= nil
end

function CommonIconComponent(p1)
	-- upvalues: fFlagTokenizeUnibarConstantsWithStyleProvider (ref), unibarStyle (ref), constantsModule (ref), useMappedSignal (ref), useStyle (ref), reactModule (ref), subMenuContextModule (ref), iconName (ref), foundationModule (ref), iconSize (ref), iconVariant (ref), images (ref), imageSetLabel (ref)
	local _ = nil
	local var1 = if fFlagTokenizeUnibarConstantsWithStyleProvider then unibarStyle.use().ICON_SIZE else constantsModule.ICON_SIZE
	local activeSignalValue = p1.activeSignalValue and useMappedSignal(p1.activeSignalValue) or false
	local var2 = if activeSignalValue and p1.iconOn then p1.iconOn else p1.icon
	local var3 = useStyle()
	local var4 = reactModule.useContext(subMenuContextModule)
	local color = var3.Theme.IconEmphasis.Color
	local transparency = var3.Theme.IconEmphasis.Transparency
	
	if iconName[p1.icon] ~= nil then
		return reactModule.createElement(foundationModule.Icon, {
			name = iconName[p1.icon],
			size = iconSize.Large,
			style = if var4 then var4:map(function(p2)
				-- upvalues: color (ref), transparency (ref)
				return {
					Color3 = color,
					Transparency = transparency + (1 - transparency) * (1 - p2)
				}
			end) else { Color3 = color, Transparency = transparency },
			variant = if activeSignalValue then iconVariant.Filled else iconVariant.Regular
		})
	elseif typeof(var2) == "string" and var2:sub(1, 11) ~= "rbxasset://" then
		var2 = images[var2]
	end
	return reactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		Image = var2,
		Size = UDim2.new(0, var1, 0, var1),
		ImageColor3 = color,
		ImageTransparency = if var4 then var4:map(function(p2)
			-- upvalues: transparency (ref)
			return transparency + (1 - transparency) * (1 - p2)
		end) else transparency
	})
end

function CommonIcon(p1, p2, p3)
	-- upvalues: reactModule (ref)
	return reactModule.createElement(CommonIconComponent, { icon = p1, iconOn = p2, activeSignalValue = p3 })
end

return CommonIcon