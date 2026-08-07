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
local var10 = (function() --[[ line: 37 | named "Initialize" ]]
	-- upvalues: robloxGui (ref), uiblox (ref), builderIconsModule (ref), VRService (ref), themeModule (ref), create (ref), textService (ref), utilityModule (ref), rbxAnalyticsService (ref), contexts (ref), eventTypes (ref), eventNames (ref), coreGuiService (ref)
	local record = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
	local var12 = false
	local recordingEvent = Instance.new("BindableEvent")
	recordingEvent.Name = "RecordingEvent"
	record.RecordingChanged = recordingEvent.Event
	
	function record.IsRecording(_) --[[ line: 45 ]]
		-- upvalues: var12 (write)
		return var12
	end
	
	local screenrecord = uiblox["icons/controls/screenrecord"]
	record.TabHeader.TabLabel.Icon.Text = screenrecord.name
	record.TabHeader.TabLabel.Icon.FontFace = builderIconsModule.Font[screenrecord.variant]
	record.TabHeader.Name = "RecordTab"
	record.TabHeader.TabLabel.Title.Text = "Record"
	
	local function onVREnabled() --[[ line: 55 ]]
		-- upvalues: record (ref), VRService (copy)
		record.TabHeader.Visible = not VRService.VREnabled
	end
	
	record.TabHeader.Visible = not VRService.VREnabled
	VRService:GetPropertyChangedSignal("VREnabled"):connect(onVREnabled)
	record.Page.Name = "Record"
	
	local function makeTextLabel(p0, p1, p2, p3, p4) --[[ line: 64 ]]
		-- upvalues: themeModule (copy), create (copy), textService (copy)
		local var16 = 10
		local var17 = 0
		local var18 = 10
		local var19 = themeModule.textSize(24)
		local var20 = themeModule.font(Enum.Font.SourceSans)
		
		if p2 then
			var16 = 10
			var17 = 0
			var18 = 0
			var19 = themeModule.textSize(36)
			var20 = themeModule.font(Enum.Font.SourceSansBold, "Bold")
		end
		local var21 = create("Frame")({
			BackgroundTransparency = 1,
			ZIndex = 2,
			Name = p0 .. "Container",
			LayoutOrder = p4,
			Parent = p3
		})
		local var22 = create("TextLabel")({
			BackgroundTransparency = 1,
			TextWrapped = true,
			ZIndex = 2,
			Name = p0,
			Text = p1,
			Font = var20,
			TextSize = var19,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Position = UDim2.new(0, var16, 0, 0),
			Size = UDim2.new(1, -(var16 + var17), 1, 0),
			Parent = var21
		})
		
		local function onResized(p5) --[[ line: 96 ]]
			-- upvalues: textService (copy), p1 (ref), var22 (ref), p3 (ref), var16 (write), var17 (write), var21 (ref), var18 (write)
			if p5 == "AbsoluteSize" then
				var21.Size = UDim2.new(1, 0, 0, textService:GetTextSize(p1, var22.TextSize, var22.Font, Vector2.new(p3.AbsoluteSize.X - var16 - var17, 10000)).Y + var18)
			end
		end
		
		var21.Size = UDim2.new(1, 0, 0, textService:GetTextSize(p1, var22.TextSize, var22.Font, Vector2.new(p3.AbsoluteSize.X - var16 - var17, 10000)).Y + var18)
		p3.Changed:connect(onResized)
		
		return var22, var21
	end
	
	function record.SetHub(_, p6) --[[ line: 110 ]]
		-- upvalues: record (ref), makeTextLabel (ref), utilityModule (copy), rbxAnalyticsService (copy), contexts (copy), eventTypes (copy), var12 (write), eventNames (copy), recordingEvent (ref), coreGuiService (copy)
		record.HubRef = p6
		
		local var24 = function() --[[ line: 114 ]]
			-- upvalues: record (copy)
			record.HubRef:SetVisibility(false, true)
		end
		
		local _ = makeTextLabel("ScreenshotTitle", "Screenshot", true, record.Page, 1)
		local _ = makeTextLabel("ScreenshotBody", "By clicking the 'Take Screenshot' button, the menu will close and take a screenshot and save it to your computer.", false, record.Page, 2)
		local var25, var26 = utilityModule:AddButtonRow(record, "ScreenshotButton", "Take Screenshot", UDim2.new(0, 300, 0, 44), var24)
		record.ScreenshotButtonRow = var25
		record.ScreenshotButton = var26
		record.ScreenshotButtonRow.LayoutOrder = 3
		local _ = makeTextLabel("VideoTitle", "Video", true, record.Page, 4)
		local _ = makeTextLabel("VideoBody", "By clicking the 'Record Video' button, the menu will close and start recording your screen.", false, record.Page, 5)
		local var27, var28 = utilityModule:AddButtonRow(record, "RecordButton", "Record Video", UDim2.new(0, 300, 0, 44), var24)
		var27.LayoutOrder = 6
		var28.MouseButton1Click:connect(function() --[[ line: 130 ]]
			-- upvalues: rbxAnalyticsService (copy), contexts (copy), eventTypes (copy), var12 (copy), eventNames (copy), recordingEvent (copy)
			rbxAnalyticsService:SendEventDeferred("mobile", contexts.Captures, eventTypes.ButtonClick, {
				btn = if not var12 then eventNames.CapturesLegacyVideoRecordActivated else eventNames.CapturesLegacyVideoRecordDeactivated
			})
			recordingEvent:Fire(not var12)
		end)
		local var29 = settings():FindFirstChild("Game Options")
		
		if var29 then
			var29.VideoRecordingChangeRequest:connect(function(p7) --[[ line: 142 ]]
				-- upvalues: var12 (copy), var28 (ref)
				var12 = p7
				
				if p7 then
					var28.RecordButtonTextLabel.Text = "Stop Recording"
					
					return
				end
				var28.RecordButtonTextLabel.Text = "Record Video"
			end)
		end
		var28.Activated:Connect(function() --[[ line: 152 ]]
			-- upvalues: coreGuiService (copy)
			coreGuiService:ToggleRecording()
		end)
		record.ScreenshotButton.Activated:Connect(function() --[[ line: 155 ]]
			-- upvalues: coreGuiService (copy)
			coreGuiService:TakeScreenshot()
		end)
		record.Page.Size = UDim2.new(1, 0, 0, 400)
	end
	
	return record
end)()
var10.Displayed.Event:connect(function(p8) --[[ line: 169 ]]
	-- upvalues: guiService (ref), var10 (write)
	if p8 then
		guiService.SelectedCoreObject = var10.ScreenshotButton
	end
end)

return var10