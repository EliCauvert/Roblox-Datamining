local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local guiService = game:GetService("GuiService")
local textService = game:GetService("TextService")
local VRService = game:GetService("VRService")
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local enums = require(corePackagesService.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums
local eventNames = require(corePackagesService.Workspace.Packages.CapturesInExperience).Analytics.EventNames
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local builderIconsModule = require(corePackagesService.Packages.BuilderIcons)
local uiblox = builderIconsModule.Migration.uiblox
local _ = nil
local contexts = enums.Contexts
local eventTypes = enums.EventTypes
local var1 = (function()
	-- upvalues: robloxGui (ref), uiblox (ref), builderIconsModule (ref), VRService (ref), themeModule (ref), create (ref), textService (ref), utilityModule (ref), rbxAnalyticsService (ref), contexts (ref), eventTypes (ref), eventNames (ref), coreGuiService (ref)
	local record = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	local var2 = false
	local recordingEvent = Instance.new("BindableEvent")
	recordingEvent.Name = "RecordingEvent"
	record.RecordingChanged = recordingEvent.Event
	
	function record.IsRecording(_)
		-- upvalues: var2 (write)
		return var2
	end
	
	local screenrecord = uiblox["icons/controls/screenrecord"]
	record.TabHeader.TabLabel.Icon.Text = screenrecord.name
	record.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[screenrecord.variant]
	record.TabHeader.Name = "RecordTab"
	record.TabHeader.TabLabel.Title.Text = "Record"
	
	local function onVREnabled()
		-- upvalues: record (ref), VRService (copy)
		record.TabHeader.Visible = not VRService.VREnabled
	end
	
	record.TabHeader.Visible = not VRService.VREnabled
	VRService:GetPropertyChangedSignal("VREnabled"):connect(onVREnabled)
	record.Page.Name = "Record"
	
	local function makeTextLabel(p1, p2, p3, p4, p5)
		-- upvalues: themeModule (copy), create (copy), textService (copy)
		local var3 = 10
		local var4 = 0
		local var5 = 10
		local var6 = themeModule.textSize(24)
		local var7 = themeModule.font(Enum.Font.SourceSans)
		
		if p3 then
			var3 = 10
			var4 = 0
			var5 = 0
			var6 = themeModule.textSize(36)
			var7 = themeModule.font(Enum.Font.SourceSansBold, "Bold")
		end
		local var8 = create("Frame")({
			BackgroundTransparency = 1,
			ZIndex = 2,
			Name = p1 .. "Container",
			LayoutOrder = p5,
			Parent = p4
		})
		local var9 = create("TextLabel")({
			BackgroundTransparency = 1,
			TextWrapped = true,
			ZIndex = 2,
			Name = p1,
			Text = p2,
			Font = var7,
			TextSize = var6,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Position = UDim2.new(0, var3, 0, 0),
			Size = UDim2.new(1, -(var3 + var4), 1, 0),
			Parent = var8
		})
		
		local function onResized(p6)
			-- upvalues: textService (copy), p2 (ref), var9 (ref), p4 (ref), var3 (write), var4 (write), var8 (ref), var5 (write)
			if p6 == "AbsoluteSize" then
				var8.Size = UDim2.new(1, 0, 0, textService:GetTextSize(p2, var9.TextSize, var9.Font, Vector2.new(p4.AbsoluteSize.X - var3 - var4, 10000)).Y + var5)
			end
		end
		
		var8.Size = UDim2.new(1, 0, 0, textService:GetTextSize(p2, var9.TextSize, var9.Font, Vector2.new(p4.AbsoluteSize.X - var3 - var4, 10000)).Y + var5)
		p4.Changed:connect(onResized)
		
		return var9, var8
	end
	
	function record.SetHub(_, p1)
		-- upvalues: record (ref), makeTextLabel (ref), utilityModule (copy), rbxAnalyticsService (copy), contexts (copy), eventTypes (copy), var2 (write), eventNames (copy), recordingEvent (ref), coreGuiService (copy)
		record.HubRef = p1
		
		local var3 = function()
			-- upvalues: record (copy)
			record.HubRef:SetVisibility(false, true)
		end
		
		local _ = makeTextLabel("ScreenshotTitle", "Screenshot", true, record.Page, 1)
		local _ = makeTextLabel("ScreenshotBody", "By clicking the 'Take Screenshot' button, the menu will close and take a screenshot and save it to your computer.", false, record.Page, 2)
		local var4, var5 = utilityModule:AddButtonRow(record, "ScreenshotButton", "Take Screenshot", UDim2.new(0, 300, 0, 44), var3)
		record.ScreenshotButtonRow = var4
		record.ScreenshotButton = var5
		record.ScreenshotButtonRow.LayoutOrder = 3
		local _ = makeTextLabel("VideoTitle", "Video", true, record.Page, 4)
		local _ = makeTextLabel("VideoBody", "By clicking the 'Record Video' button, the menu will close and start recording your screen.", false, record.Page, 5)
		local var6, var7 = utilityModule:AddButtonRow(record, "RecordButton", "Record Video", UDim2.new(0, 300, 0, 44), var3)
		var6.LayoutOrder = 6
		var7.MouseButton1Click:connect(function()
			-- upvalues: rbxAnalyticsService (copy), contexts (copy), eventTypes (copy), var2 (copy), eventNames (copy), recordingEvent (copy)
			rbxAnalyticsService:SendEventDeferred("mobile", contexts.Captures, eventTypes.ButtonClick, {
				btn = if not var2 then eventNames.CapturesLegacyVideoRecordActivated else eventNames.CapturesLegacyVideoRecordDeactivated
			})
			recordingEvent:Fire(not var2)
		end)
		local var8 = settings():FindFirstChild("Game Options")
		
		if var8 then
			var8.VideoRecordingChangeRequest:connect(function(p2)
				-- upvalues: var2 (copy), var7 (ref)
				var2 = p2
				
				if p2 then
					var7.RecordButtonTextLabel.Text = "Stop Recording"
					
					return
				end
				var7.RecordButtonTextLabel.Text = "Record Video"
			end)
		end
		var7.Activated:Connect(function()
			-- upvalues: coreGuiService (copy)
			coreGuiService:ToggleRecording()
		end)
		record.ScreenshotButton.Activated:Connect(function()
			-- upvalues: coreGuiService (copy)
			coreGuiService:TakeScreenshot()
		end)
		record.Page.Size = UDim2.new(1, 0, 0, 400)
	end
	
	return record
end)()
var1.Displayed.Event:connect(function(p1)
	-- upvalues: guiService (ref), var1 (write)
	if p1 then
		guiService.SelectedCoreObject = var1.ScreenshotButton
	end
end)

return var1