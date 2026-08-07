local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local soundService = game:GetService("SoundService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local dropDownSelectionModule = require(parent.Components.DropDownSelection)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local name = require(corePackagesService.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local deviceSelectionEntry = roact.PureComponent:extend("DeviceSelectionEntry")
local getFFlagTruncateDeviceSelectionModule = require(parent.Flags.GetFFlagTruncateDeviceSelection)
local getFFlagVoiceChatUILoggingModule = require(robloxGui.Modules.Flags.GetFFlagVoiceChatUILogging)
deviceSelectionEntry.DeviceType = { Input = "Input", Output = "Output" }
deviceSelectionEntry.validateProps = t.strictInterface({
	LayoutOrder = t.integer,
	deviceType = t.string,
	isMenuOpen = t.boolean,
	canOpen = t.optional(t.boolean),
	canCaptureFocus = t.optional(t.boolean)
})
deviceSelectionEntry.defaultProps = { canOpen = true }

function deviceSelectionEntry.init(p0) --[[ line: 41 ]]
	-- upvalues: default (ref), soundService (ref), getFFlagVoiceChatUILoggingModule (ref), name (ref)
	p0:setState({
		selectedIndex = 0,
		ready = false,
		deviceNames = {},
		deviceGuids = {}
	})
	default:asyncInit():andThen(function() --[[ line: 50 ]]
		-- upvalues: p0 (ref), default (copy), soundService (copy)
		p0:setState({ ready = true })
		default:SetupParticipantListeners()
		
		if soundService.DeviceListChanged then
			soundService.DeviceListChanged:Connect(function() --[[ line: 56 ]]
				-- upvalues: p0 (copy)
				if p0.props.isMenuOpen then
					p0:pollDevices(p0.props.deviceType)
				end
			end)
		end
	end):catch(function() --[[ line: 63 ]]
		-- upvalues: getFFlagVoiceChatUILoggingModule (copy), name (copy)
		if getFFlagVoiceChatUILoggingModule() then
			name:warning("Failed to init VoiceChatServiceManager")
		end
	end)
end

function deviceSelectionEntry.render(p1) --[[ line: 70 ]]
	-- upvalues: roact (ref), themedTextLabelModule (ref), deviceSelectionEntry (ref), dropDownSelectionModule (ref), getFFlagTruncateDeviceSelectionModule (ref), default (ref)
	return if p1.state.ready and p1.state.deviceNames ~= nil and #p1.state.deviceNames ~= 0 then roact.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, 120),
		LayoutOrder = p1.props.LayoutOrder
	}, {
		Padding = roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24)
		}),
		InputLabel = roact.createElement(themedTextLabelModule, {
			fontKey = "Body",
			themeKey = "TextDefault",
			Size = UDim2.new(1, 0, 0, 56),
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Text = if p1.props.deviceType == deviceSelectionEntry.DeviceType.Input then "Input Device" else "Output Device",
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Dropdown = roact.createElement(dropDownSelectionModule, {
			placeHolderText = "",
			enabled = true,
			localize = false,
			Size = UDim2.new(1, 0, 0, 44),
			Position = UDim2.new(0, 0, 0, 56),
			truncate = getFFlagTruncateDeviceSelectionModule(),
			selections = p1.state.deviceNames,
			selectedIndex = p1.state.selectedIndex,
			selectionParentName = p1.props.deviceType .. "DeviceSelectionEntryDropdown",
			canOpen = p1.props.canOpen,
			canCaptureFocus = p1.props.canCaptureFocus,
			selectionChanged = function(p2) --[[ line: 107 ]]
				-- upvalues: default (copy), p1 (ref)
				default:SwitchDevice(p1.props.deviceType, p1.state.deviceNames[p2], p1.state.deviceGuids[p2])
				p1:setState({ selectedIndex = p2 })
			end
		})
	}) else nil
end

function deviceSelectionEntry.pollDevices(p3, p4) --[[ line: 122 ]]
	-- upvalues: default (ref), getFFlagVoiceChatUILoggingModule (ref), name (ref)
	spawn(function() --[[ line: 123 ]]
		-- upvalues: default (copy), p4 (ref), p3 (ref), getFFlagVoiceChatUILoggingModule (copy), name (copy)
		local var11, var12, var13, var14 = default:GetDevices(p4)
		
		if var11 then
			p3:setState({
				deviceNames = var12,
				deviceGuids = var13,
				selectedIndex = var14
			})
			
			return
		elseif getFFlagVoiceChatUILoggingModule() then
			name:warning("Errors in get {} Device info", p4)
		end
		p3:setState({ selectedIndex = 0, deviceNames = {}, deviceGuids = {} })
	end)
end

function deviceSelectionEntry.willUpdate(p5, p6) --[[ line: 144 ]]
	if not p5.props.isMenuOpen and p6.isMenuOpen then
		p5:pollDevices(p6.deviceType)
	end
end

return deviceSelectionEntry