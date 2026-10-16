local CorePackages = game:GetService("CorePackages")
local SoundService = game:GetService("SoundService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local DropDownSelectionModule = require(Parent.Components.DropDownSelection)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local NewResult = require(CorePackages.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local DeviceSelectionEntry = Roact.PureComponent:extend("DeviceSelectionEntry")
local GetFFlagTruncateDeviceSelectionModule = require(Parent.Flags.GetFFlagTruncateDeviceSelection)
local GetFFlagVoiceChatUILoggingModule = require(RobloxGui.Modules.Flags.GetFFlagVoiceChatUILogging)
DeviceSelectionEntry.DeviceType = { Input = "Input", Output = "Output" }
DeviceSelectionEntry.validateProps = T.strictInterface({
	LayoutOrder = T.integer,
	deviceType = T.string,
	isMenuOpen = T.boolean,
	canOpen = T.optional(T.boolean),
	canCaptureFocus = T.optional(T.boolean)
})
DeviceSelectionEntry.defaultProps = { canOpen = true }

function DeviceSelectionEntry.init(p1) --[[ Line: 41 ]]
	-- upvalues: Default (copy), SoundService (copy), GetFFlagVoiceChatUILoggingModule (copy), NewResult (copy)
	p1:setState({
		selectedIndex = 0,
		ready = false,
		deviceNames = {},
		deviceGuids = {}
	})
	Default:asyncInit():andThen(function() --[[ Line: 50 ]]
		-- upvalues: p1 (copy), Default (upval), SoundService (upval)
		p1:setState({ ready = true })
		Default:SetupParticipantListeners()
		
		if SoundService.DeviceListChanged then
			SoundService.DeviceListChanged:Connect(function() --[[ Line: 56 ]]
				-- upvalues: p1 (upval)
				if p1.props.isMenuOpen then
					p1:pollDevices(p1.props.deviceType)
				end
			end)
		end
	end):catch(function() --[[ Line: 63 ]]
		-- upvalues: GetFFlagVoiceChatUILoggingModule (upval), NewResult (upval)
		if GetFFlagVoiceChatUILoggingModule() then
			NewResult:warning("Failed to init VoiceChatServiceManager")
		end
	end)
end

function DeviceSelectionEntry.render(p1) --[[ Line: 70 ]]
	-- upvalues: Roact (copy), ThemedTextLabelModule (copy), DeviceSelectionEntry (copy), DropDownSelectionModule (copy), GetFFlagTruncateDeviceSelectionModule (copy), Default (copy)
	return if p1.state.ready and p1.state.deviceNames ~= nil and #p1.state.deviceNames ~= 0 then Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 0, 120),
		LayoutOrder = p1.props.LayoutOrder
	}, {
		Padding = Roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24)
		}),
		InputLabel = Roact.createElement(ThemedTextLabelModule, {
			fontKey = "Body",
			themeKey = "TextDefault",
			Size = UDim2.new(1, 0, 0, 56),
			Position = UDim2.new(0, 0, 0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Text = if p1.props.deviceType == DeviceSelectionEntry.DeviceType.Input then "Input Device" else "Output Device",
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left
		}),
		Dropdown = Roact.createElement(DropDownSelectionModule, {
			placeHolderText = "",
			enabled = true,
			localize = false,
			Size = UDim2.new(1, 0, 0, 44),
			Position = UDim2.new(0, 0, 0, 56),
			truncate = GetFFlagTruncateDeviceSelectionModule(),
			selections = p1.state.deviceNames,
			selectedIndex = p1.state.selectedIndex,
			selectionParentName = p1.props.deviceType .. "DeviceSelectionEntryDropdown",
			canOpen = p1.props.canOpen,
			canCaptureFocus = p1.props.canCaptureFocus,
			selectionChanged = function(SelectedIndex) --[[ Line: 107 ]]
				-- upvalues: Default (upval), p1 (copy)
				Default:SwitchDevice(p1.props.deviceType, p1.state.deviceNames[SelectedIndex], p1.state.deviceGuids[SelectedIndex])
				p1:setState({ selectedIndex = SelectedIndex })
			end
		})
	}) else nil
end

function DeviceSelectionEntry.pollDevices(p1, DeviceType) --[[ Line: 122 ]]
	-- upvalues: Default (copy), GetFFlagVoiceChatUILoggingModule (copy), NewResult (copy)
	spawn(function() --[[ Line: 123 ]]
		-- upvalues: Default (upval), DeviceType (copy), p1 (copy), GetFFlagVoiceChatUILoggingModule (upval), NewResult (upval)
		local Devices, Devices2, Devices3, Devices4 = Default:GetDevices(DeviceType)
		
		if Devices then
			p1:setState({
				deviceNames = Devices2,
				deviceGuids = Devices3,
				selectedIndex = Devices4
			})
			
			return
		end
		if GetFFlagVoiceChatUILoggingModule() then
			NewResult:warning("Errors in get {} Device info", DeviceType)
		end
		p1:setState({ selectedIndex = 0, deviceNames = {}, deviceGuids = {} })
	end)
end

function DeviceSelectionEntry.willUpdate(p1, p2) --[[ Line: 144 ]]
	if not p1.props.isMenuOpen and p2.isMenuOpen then
		p1:pollDevices(p2.deviceType)
	end
end

return DeviceSelectionEntry