local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local GuiService = game:GetService("GuiService")
local TextService = game:GetService("TextService")
local VRService = game:GetService("VRService")
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local Enums = require(CorePackages.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums
local EventNames = require(CorePackages.Workspace.Packages.CapturesInExperience).Analytics.EventNames
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local BuilderIconsModule = require(CorePackages.Packages.BuilderIcons)
local Uiblox = BuilderIconsModule.Migration.uiblox
local v1 = nil
local Contexts = Enums.Contexts
local EventTypes = Enums.EventTypes
v1 = (function() --[[ Line: 37 | Named "Initialize" ]]
	-- upvalues: RobloxGui (copy), Uiblox (copy), BuilderIconsModule (copy), VRService (copy), ThemeModule (copy), CreateFunction (copy), TextService (copy), UtilityModule (copy), RbxAnalyticsService (copy), Contexts (copy), EventTypes (copy), EventNames (copy), CoreGui (copy)
	local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	local v2 = false
	local RecordingEvent = Instance.new("BindableEvent")
	RecordingEvent.Name = "RecordingEvent"
	NewPage.RecordingChanged = RecordingEvent.Event
	
	function NewPage:IsRecording() --[[ Line: 45 ]]
		-- upvalues: v2 (ref)
		return v2
	end
	
	local IconsControlsScreenrecord = Uiblox["icons/controls/screenrecord"]
	NewPage.TabHeader.TabLabel.Icon.Text = IconsControlsScreenrecord.name
	NewPage.TabHeader.TabLabel.Icon.FontFace = BuilderIconsModule.Font[IconsControlsScreenrecord.variant]
	NewPage.TabHeader.Name = "RecordTab"
	NewPage.TabHeader.TabLabel.Title.Text = "Record"
	
	local function onVREnabled() --[[ Line: 55 ]]
		-- upvalues: NewPage (copy), VRService (upval)
		NewPage.TabHeader.Visible = not VRService.VREnabled
	end
	
	NewPage.TabHeader.Visible = not VRService.VREnabled
	VRService:GetPropertyChangedSignal("VREnabled"):connect(onVREnabled)
	NewPage.Page.Name = "Record"
	
	local function makeTextLabel(Name, Text, p1, Page: Frame, LayoutOrder) --[[ Line: 64 ]]
		-- upvalues: ThemeModule (upval), CreateFunction (upval), TextService (upval)
		local XOffset = 10
		local v3 = 0
		local v4 = 10
		local TextSizeResult = ThemeModule.textSize(24)
		local FontResult = ThemeModule.font(Enum.Font.SourceSans)
		
		if p1 then
			XOffset = 10
			v3 = 0
			v4 = 0
			TextSizeResult = ThemeModule.textSize(36)
			FontResult = ThemeModule.font(Enum.Font.SourceSansBold, "Bold")
		end
		local Parent = CreateFunction("Frame")({
			BackgroundTransparency = 1,
			ZIndex = 2,
			Name = Name .. "Container",
			LayoutOrder = LayoutOrder,
			Parent = Page
		})
		local Label = CreateFunction("TextLabel")({
			BackgroundTransparency = 1,
			TextWrapped = true,
			ZIndex = 2,
			Name = Name,
			Text = Text,
			Font = FontResult,
			TextSize = TextSizeResult,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Position = UDim2.new(0, XOffset, 0, 0),
			Size = UDim2.new(1, -(XOffset + v3), 1, 0),
			Parent = Parent
		})
		
		local function onResized(p2) --[[ Line: 96 ]]
			-- upvalues: TextService (upval), Text (copy), Label (copy), Page (copy), XOffset (ref), v3 (ref), Parent (copy), v4 (ref)
			if p2 == "AbsoluteSize" then
				Parent.Size = UDim2.new(1, 0, 0, TextService:GetTextSize(Text, Label.TextSize, Label.Font, Vector2.new(Page.AbsoluteSize.X - XOffset - v3, 10000)).Y + v4)
			end
		end
		
		Parent.Size = UDim2.new(1, 0, 0, TextService:GetTextSize(Text, Label.TextSize, Label.Font, Vector2.new(Page.AbsoluteSize.X - XOffset - v3, 10000)).Y + v4)
		Page.Changed:connect(onResized)
		
		return Label, Parent
	end
	
	function NewPage:SetHub(HubRef) --[[ Line: 110 ]]
		-- upvalues: NewPage (copy), makeTextLabel (copy), UtilityModule (upval), RbxAnalyticsService (upval), Contexts (upval), EventTypes (upval), v2 (ref), EventNames (upval), RecordingEvent (copy), CoreGui (upval)
		NewPage.HubRef = HubRef
		
		local function v30() --[[ Line: 114 ]]
			-- upvalues: NewPage (upval)
			NewPage.HubRef:SetVisibility(false, true)
		end
		
		local _ = makeTextLabel("ScreenshotTitle", "Screenshot", true, NewPage.Page, 1)
		local _ = makeTextLabel("ScreenshotBody", "By clicking the 'Take Screenshot' button, the menu will close and take a screenshot and save it to your computer.", false, NewPage.Page, 2)
		NewPage.ScreenshotButtonRow, NewPage.ScreenshotButton = UtilityModule:AddButtonRow(NewPage, "ScreenshotButton", "Take Screenshot", UDim2.new(0, 300, 0, 44), v30)
		NewPage.ScreenshotButtonRow.LayoutOrder = 3
		local _ = makeTextLabel("VideoTitle", "Video", true, NewPage.Page, 4)
		local _ = makeTextLabel("VideoBody", "By clicking the 'Record Video' button, the menu will close and start recording your screen.", false, NewPage.Page, 5)
		local RecordButton, RecordButton2 = UtilityModule:AddButtonRow(NewPage, "RecordButton", "Record Video", UDim2.new(0, 300, 0, 44), v30)
		RecordButton.LayoutOrder = 6
		RecordButton2.MouseButton1Click:connect(function() --[[ Line: 130 ]]
			-- upvalues: RbxAnalyticsService (upval), Contexts (upval), EventTypes (upval), v2 (upval), EventNames (upval), RecordingEvent (upval)
			RbxAnalyticsService:SendEventDeferred("mobile", Contexts.Captures, EventTypes.ButtonClick, {
				btn = if v2 then EventNames.CapturesLegacyVideoRecordDeactivated else EventNames.CapturesLegacyVideoRecordActivated
			})
			RecordingEvent:Fire(not v2)
		end)
		local GameOptions = settings():FindFirstChild("Game Options")
		
		if GameOptions then
			GameOptions.VideoRecordingChangeRequest:connect(function(Recording) --[[ Line: 142 ]]
				-- upvalues: v2 (upval), RecordButton2 (copy)
				v2 = Recording
				
				if Recording then
					RecordButton2.RecordButtonTextLabel.Text = "Stop Recording"
					
					return
				else
					RecordButton2.RecordButtonTextLabel.Text = "Record Video"
				end
			end)
		end
		RecordButton2.Activated:Connect(function() --[[ Line: 152 ]]
			-- upvalues: CoreGui (upval)
			CoreGui:ToggleRecording()
		end)
		NewPage.ScreenshotButton.Activated:Connect(function() --[[ Line: 155 ]]
			-- upvalues: CoreGui (upval)
			CoreGui:TakeScreenshot()
		end)
		NewPage.Page.Size = UDim2.new(1, 0, 0, 400)
	end
	
	return NewPage
end)()
v1.Displayed.Event:connect(function(p1) --[[ Line: 169 ]]
	-- upvalues: GuiService (copy), v1 (ref)
	if p1 then
		GuiService.SelectedCoreObject = v1.ScreenshotButton
	end
end)

return v1