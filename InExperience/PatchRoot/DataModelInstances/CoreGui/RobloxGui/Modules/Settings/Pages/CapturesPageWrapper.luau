local corePackagesService = game:GetService("CorePackages")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local settingsPageFactoryModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.SettingsPageFactory)
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
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
local var2 = if fFlagIGMChangeGalleryHeaderIconModule then {
	name = "image",
	variant = foundationModule.Enums.IconVariant.Regular
} elseif var1 then uiblox["icons/controls/cameraOff"] else uiblox["icons/controls/screenshot"]
captures.TabHeader.TabLabel.Icon.Text = var2.name
captures.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[var2.variant]
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
function captures.ConnectHubToApp(_, p1, p2, p3)
	-- upvalues: captures (ref), getFFlagFixIGMTabTransitionsModule (ref)
	captures:SetHub(p1)
	local var3 = p2.AbsoluteSize.Y - 20
	captures.Page.Size = UDim2.new(1, 0, 0, var3)
	p2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: var3 (write), p2 (ref), captures (copy)
		var3 = p2.AbsoluteSize.Y - 20
		captures.Page.Size = UDim2.new(1, 0, 0, var3)
	end)
	local display = captures.Display
	
	function captures.Display(_, ...)
		-- upvalues: p3 (ref), display (ref), captures (copy)
		p3.openMenu()
		display(captures, ...)
	end
	
	captures.Hidden.Event:Connect(function()
		-- upvalues: getFFlagFixIGMTabTransitionsModule (copy), p3 (ref)
		if not getFFlagFixIGMTabTransitionsModule() then
			p3.closeMenu()
		end
	end)
	local hide = captures.Hide
	
	function captures.Hide(_, ...)
		-- upvalues: getFFlagFixIGMTabTransitionsModule (copy), p3 (ref), hide (ref), captures (copy)
		if getFFlagFixIGMTabTransitionsModule() then
			p3.closeMenu()
		end
		hide(captures, ...)
	end
end

return captures