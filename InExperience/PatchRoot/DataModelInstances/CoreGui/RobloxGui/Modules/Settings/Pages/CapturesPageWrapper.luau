local corePackagesService = game:GetService("CorePackages")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local settingsPageFactoryModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.SettingsPageFactory)
local var3 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local uiblox = builderIconsModule.Migration.uiblox
local foundationModule = require(corePackagesService.Packages.Foundation)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local getFFlagFixIGMTabTransitionsModule = require(script.Parent.Parent.Flags.GetFFlagFixIGMTabTransitions)
local fFlagIGMChangeCapturesToGalleryModule = require(script.Parent.Parent.Flags.FFlagIGMChangeCapturesToGallery)
local fFlagIGMChangeGalleryHeaderIconModule = require(script.Parent.Parent.Flags.FFlagIGMChangeGalleryHeaderIcon)
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local captures = settingsPageFactoryModule:CreateNewPage()
captures.TabHeader.Name = "CapturesTab"
local var11 = if fFlagIGMChangeGalleryHeaderIconModule then {
	name = "image",
	variant = foundationModule.Enums.IconVariant.Regular
} elseif var3 then uiblox["icons/controls/cameraOff"] else uiblox["icons/controls/screenshot"]
captures.TabHeader.TabLabel.Icon.Text = var11.name
captures.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[var11.variant]
captures.TabHeader.TabLabel.Title.AutoLocalize = false

if fFlagIGMChangeCapturesToGalleryModule then
	captures.TabHeader.TabLabel.Title.Text = robloxTranslatorModule:FormatByKey("Feature.Captures.Title.Gallery")
else
	captures.TabHeader.TabLabel.Title.Text = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Captures")
end
captures.PageListLayout.Parent = nil
captures.ShouldShowBottomBar = not fFlagEnableSideSheet
captures.ShouldShowHubBar = true
captures.Page.Name = "Captures"
captures.Page.Size = UDim2.fromScale(1, 0)
local UIPadding = captures.Page:FindFirstChildWhichIsA("UIPadding")

if UIPadding then
	UIPadding:Destroy()
end
function captures.ConnectHubToApp(_, p0, p1, p2)
	-- upvalues: captures (ref), getFFlagFixIGMTabTransitionsModule (ref)
	captures:SetHub(p0)
	local var13 = p1.AbsoluteSize.Y - 20
	captures.Page.Size = UDim2.new(1, 0, 0, var13)
	p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: var13 (write), p1 (ref), captures (copy)
		var13 = p1.AbsoluteSize.Y - 20
		captures.Page.Size = UDim2.new(1, 0, 0, var13)
	end)
	local display = captures.Display
	
	function captures.Display(_, ...)
		-- upvalues: p2 (ref), display (ref), captures (copy)
		p2.openMenu()
		display(captures, ...)
	end
	
	captures.Hidden.Event:Connect(function()
		-- upvalues: getFFlagFixIGMTabTransitionsModule (copy), p2 (ref)
		if not getFFlagFixIGMTabTransitionsModule() then
			p2.closeMenu()
		end
	end)
	local hide = captures.Hide
	
	function captures.Hide(_, ...)
		-- upvalues: getFFlagFixIGMTabTransitionsModule (copy), p2 (ref), hide (ref), captures (copy)
		if getFFlagFixIGMTabTransitionsModule() then
			p2.closeMenu()
		end
		hide(captures, ...)
	end
end

return captures