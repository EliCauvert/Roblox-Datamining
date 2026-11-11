local CorePackages = game:GetService("CorePackages")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local Uiblox = BuilderIconsModule.Migration.uiblox
local FoundationModule = require(CorePackages.Packages.Foundation)
local GetFFlagFixIGMTabTransitionsModule = require(script.Parent.Parent.Flags.GetFFlagFixIGMTabTransitions)
local FFlagIGMChangeCapturesToGalleryModule = require(script.Parent.Parent.Flags.FFlagIGMChangeCapturesToGallery)
local FFlagEnableSideSheet = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSideSheet
local NewPage = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.SettingsPageFactory):CreateNewPage()
NewPage.TabHeader.Name = "CapturesTab"
local Config = if require(script.Parent.Parent.Flags.FFlagIGMChangeGalleryHeaderIcon) then {
	name = "image",
	variant = FoundationModule.Enums.IconVariant.Regular
} elseif EnabledResult then Uiblox["icons/controls/cameraOff"] else Uiblox["icons/controls/screenshot"]
NewPage.TabHeader.TabLabel.Icon.Text = Config.name
NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[Config.variant]
NewPage.TabHeader.TabLabel.Title.AutoLocalize = false

if FFlagIGMChangeCapturesToGalleryModule then
	NewPage.TabHeader.TabLabel.Title.Text = RobloxTranslatorModule:FormatByKey("Feature.Captures.Title.Gallery")
else
	NewPage.TabHeader.TabLabel.Title.Text = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Captures")
end
NewPage.PageListLayout.Parent = nil
NewPage.ShouldShowBottomBar = not FFlagEnableSideSheet
NewPage.ShouldShowHubBar = true
NewPage.Page.Name = "Captures"
NewPage.Page.Size = UDim2.fromScale(1, 0)
local UIPadding = NewPage.Page:FindFirstChildWhichIsA("UIPadding")

if UIPadding then
	UIPadding:Destroy()
end
function NewPage:ConnectHubToApp(p1, Frame: Frame, p2)
	-- upvalues: NewPage (copy), GetFFlagFixIGMTabTransitionsModule (copy)
	NewPage:SetHub(p1)
	local YDelta = Frame.AbsoluteSize.Y - 20
	NewPage.Page.Size = UDim2.new(1, 0, 0, YDelta)
	Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: YDelta (ref), Frame (copy), NewPage (upval)
		YDelta = Frame.AbsoluteSize.Y - 20
		NewPage.Page.Size = UDim2.new(1, 0, 0, YDelta)
	end)
	local DisplayFunction = NewPage.Display
	
	function NewPage:Display(...)
		-- upvalues: p2 (copy), DisplayFunction (copy), NewPage (upval)
		p2.openMenu()
		DisplayFunction(NewPage, ...)
	end
	
	NewPage.Hidden.Event:Connect(function()
		-- upvalues: GetFFlagFixIGMTabTransitionsModule (upval), p2 (copy)
		if not GetFFlagFixIGMTabTransitionsModule() then
			p2.closeMenu()
		end
	end)
	local HideFunction = NewPage.Hide
	
	function NewPage:Hide(...)
		-- upvalues: GetFFlagFixIGMTabTransitionsModule (upval), p2 (copy), HideFunction (copy), NewPage (upval)
		if GetFFlagFixIGMTabTransitionsModule() then
			p2.closeMenu()
		end
		HideFunction(NewPage, ...)
	end
end

return NewPage