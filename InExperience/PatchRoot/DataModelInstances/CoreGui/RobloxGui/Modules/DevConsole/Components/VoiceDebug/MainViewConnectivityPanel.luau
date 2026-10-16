local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local IceCandidateParserModule = require(script.Parent.IceCandidateParser)
local CollapsibleSectionModule = require(script.Parent.CollapsibleSection)
local _ = require(script.Parent.VoiceDebugData)
local GetFFlagVoiceDebugConsoleV2Module = require(script.Parent.GetFFlagVoiceDebugConsoleV2)
local MainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding
local _UDim = UDim.new(0.55, 0)
local _UDim1 = UDim.new(0.25, 0)
local _UDim2 = UDim.new(0.2, 0)
local _UDim3 = UDim.new(0.4, 0)
local _UDim4 = UDim.new(0.3, 0)
local HoverGreen = ConstantsModule.Color.HoverGreen
local WarningYellow = ConstantsModule.Color.WarningYellow
local ErrorRed = ConstantsModule.Color.ErrorRed
local UnselectedGray = ConstantsModule.Color.UnselectedGray
local config = {
	complete = true,
	completed = true,
	connected = true,
	stable = true
}
local config1 = { checking = true, connecting = true, new = true }
local config2 = { failed = true, disconnected = true, closed = true }
local config3 = {
	host = {
		background = Color3.fromRGB(13, 39, 64),
		text = Color3.fromRGB(95, 184, 255)
	},
	srflx = {
		background = Color3.fromRGB(42, 26, 48),
		text = Color3.fromRGB(176, 122, 240)
	},
	relay = {
		background = Color3.fromRGB(42, 32, 16),
		text = Color3.fromRGB(224, 176, 64)
	},
	prflx = {
		background = Color3.fromRGB(16, 42, 32),
		text = Color3.fromRGB(96, 200, 160)
	}
}
local config4 = {
	background = Color3.fromRGB(28, 28, 28),
	text = Color3.fromRGB(107, 111, 117)
}
local _UDim5 = UDim.new(0.17, 0)
local _UDim6 = UDim.new(0.14, 0)
local _UDim7 = UDim.new(0.25, 0)
local _UDim8 = UDim.new(0.14, 0)
local _UDim9 = UDim.new(0.17, 0)
local _UDim10 = UDim.new(0.13, 0)

local function _(Text: string): string --[[ Line: 65 | Named "richTextEscape" ]]
	return (string.gsub(Text, "[<>&\"']", {
		["<"] = "&lt;",
		[">"] = "&gt;",
		["&"] = "&amp;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	}))
end

local function GroupHeader(p1) --[[ Line: 77 ]]
	-- upvalues: RoactModule (copy), CellLabelModule (copy)
	local Subtitle: string = p1.subtitle
	local Formatted = string.format("<b>%s</b>", (string.gsub(p1.title, "[<>&\"']", {
		["<"] = "&lt;",
		[">"] = "&gt;",
		["&"] = "&amp;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	})))
	
	if Subtitle then
		Formatted ..= string.format("  <font color=\"#%s\">%s</font>", "B8B8B8", (string.gsub(Subtitle, "[<>&\"']", {
			["<"] = "&lt;",
			[">"] = "&gt;",
			["&"] = "&amp;",
			["\""] = "&quot;",
			["'"] = "&apos;"
		})))
	end
	return RoactModule.createElement(CellLabelModule, {
		richText = true,
		text = Formatted,
		layoutOrder = p1.layoutOrder,
		size = UDim2.new(1, 0, 0, 20),
		pos = UDim2.new()
	})
end

local function HeaderCell(p1) --[[ Line: 95 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy)
	return RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Text = string.upper(p1.text),
		Size = p1.size,
		Position = p1.pos,
		Font = ConstantsModule.Font.MainWindowHeader,
		TextSize = ConstantsModule.DefaultFontSize.MainWindowHeader,
		TextColor3 = ConstantsModule.Color.BorderGray,
		TextXAlignment = Enum.TextXAlignment.Left
	})
end

local _ = function(p1) --[[ Line: 108 | Named "formatLegState" ]]
	return if p1 == nil or p1 == "" then "—" else p1
end

local _ = function(p1) --[[ Line: 115 | Named "statusDotColor" ]]
	-- upvalues: config (copy), HoverGreen (copy), config1 (copy), WarningYellow (copy), config2 (copy), ErrorRed (copy), UnselectedGray (copy)
	if p1 ~= nil then
		if config[p1] then
			return HoverGreen
		elseif config1[p1] then
			return WarningYellow
		elseif config2[p1] then
			return ErrorRed
		end
	end
	return UnselectedGray
end

local _ = function(ErrorRed1): boolean --[[ Line: 128 | Named "isAlertColor" ]]
	-- upvalues: WarningYellow (copy), ErrorRed (copy)
	return ErrorRed1 == WarningYellow or ErrorRed1 == ErrorRed
end

local function LegCell(p1) --[[ Line: 132 ]]
	-- upvalues: RoactModule (copy), CellLabelModule (copy)
	local Color = p1.color
	local XOffset: number = if Color then 12 else 0
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.size,
		Position = p1.pos
	}, {
		Dot = Color and RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(0, 7, 0, 7),
			BackgroundColor3 = Color
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}) or nil,
		Value = RoactModule.createElement(CellLabelModule, {
			text = p1.text,
			size = UDim2.new(1, -XOffset, 1, 0),
			pos = UDim2.new(0, XOffset, 0, 0)
		})
	})
end

local function formatSelectedCandidatePair(SelectedCandidatePairLocalTypePublish, SelectedCandidatePairRemoteTypePublish, SelectedCandidatePairLocalProtocolPublish) --[[ Line: 165 ]]
	return if SelectedCandidatePairLocalTypePublish == nil or SelectedCandidatePairLocalTypePublish == "" or SelectedCandidatePairRemoteTypePublish == nil or SelectedCandidatePairRemoteTypePublish == "" then nil elseif SelectedCandidatePairLocalProtocolPublish and SelectedCandidatePairLocalProtocolPublish ~= "" then string.format("%s ↔ %s (%s)", SelectedCandidatePairLocalTypePublish, SelectedCandidatePairRemoteTypePublish, SelectedCandidatePairLocalProtocolPublish) else string.format("%s ↔ %s", SelectedCandidatePairLocalTypePublish, SelectedCandidatePairRemoteTypePublish)
end

local function TransportStateTable(p1) --[[ Line: 175 ]]
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy), config (copy), HoverGreen (copy), config1 (copy), WarningYellow (copy), config2 (copy), ErrorRed (copy), UnselectedGray (copy), RoactModule (copy), ConstantsModule (copy), CellLabelModule (copy), _UDim3 (copy), LegCell (copy), _UDim4 (copy), formatSelectedCandidatePair (copy), GroupHeader (copy), HeaderCell (copy)
	local Connectivity = p1.connectivity or {}
	local LayoutOrder = p1.layoutOrder
	local FFlagVoiceDebugConsoleV2Module = GetFFlagVoiceDebugConsoleV2Module()
	local list = {
		{
			label = "ICE gathering",
			publish = Connectivity.iceGatheringStatePublish,
			subscribe = Connectivity.iceGatheringStateSubscribe
		},
		{
			label = "ICE connection",
			publish = Connectivity.iceConnectionStatePublish,
			subscribe = Connectivity.iceConnectionStateSubscribe
		},
		{
			label = "Signaling",
			publish = Connectivity.signalingStatePublish,
			subscribe = Connectivity.signalingStateSubscribe
		}
	}
	local Frames = {}
	local Color1 = nil
	
	for LayoutOrder1, value in list do
		repeat
			if FFlagVoiceDebugConsoleV2Module then
				local Publish = value.publish
				repeat
					if Publish ~= nil then
						if config[Publish] then
							local Color = HoverGreen
							break
						end
						if config1[Publish] then
							local Color = WarningYellow
							break
						end
						if config2[Publish] then
							local Color = ErrorRed
							break
						end
					end
					local Color = UnselectedGray
				until true
				if Color then break end
			end
			local Color = nil
		until true
		if FFlagVoiceDebugConsoleV2Module then
			local Subscribe = value.subscribe
			repeat
				if Subscribe ~= nil then
					if config[Subscribe] then
						Color1 = HoverGreen
						break
					end
					if config1[Subscribe] then
						Color1 = WarningYellow
						break
					end
					if config2[Subscribe] then
						Color1 = ErrorRed
						break
					end
				end
				Color1 = UnselectedGray
			until true
			if Color1 then
				local IsColorMatch: boolean = FFlagVoiceDebugConsoleV2Module and (Color == WarningYellow or Color == ErrorRed or (Color1 == WarningYellow or Color1 == ErrorRed))
				local Publish1 = value.publish
				local config3 = {
					text = if Publish1 == nil or Publish1 == "" then "—" else Publish1,
					color = Color,
					size = UDim2.new(_UDim4, UDim.new(1, 0)),
					pos = UDim2.new(_UDim3, UDim.new(0, 0))
				}
				local Subscribe1 = value.subscribe
				Frames["row" .. LayoutOrder1] = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 20),
					LayoutOrder = LayoutOrder1
				}, {
					Accent = FFlagVoiceDebugConsoleV2Module and RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Position = UDim2.new(0, 0, 0, 0),
						Size = UDim2.new(0, 2, 1, 0),
						BackgroundColor3 = ConstantsModule.Color.WarningYellow,
						BackgroundTransparency = if IsColorMatch then 0 else 1
					}) or nil,
					Label = RoactModule.createElement(CellLabelModule, {
						text = value.label,
						size = UDim2.new(_UDim3, UDim.new(1, 0)),
						pos = UDim2.new(0, 0, 0, 0),
						textTruncate = Enum.TextTruncate.AtEnd
					}),
					Publish = RoactModule.createElement(LegCell, config3),
					Subscribe = RoactModule.createElement(LegCell, {
						text = if Subscribe1 == nil or Subscribe1 == "" then "—" else Subscribe1,
						color = Color1,
						size = UDim2.new(_UDim4, UDim.new(1, 0)),
						pos = UDim2.new(_UDim3 + _UDim4, UDim.new(0, 0))
					})
				})
				continue
			end
		end
		Color1 = nil
	end
	local Text = Connectivity.rebootCount and tostring(Connectivity.rebootCount) or nil
	Frames.restartRow = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 20),
		LayoutOrder = #list + 1
	}, {
		Label = RoactModule.createElement(CellLabelModule, {
			text = "ICE restarts (this session)",
			size = UDim2.new(_UDim3, UDim.new(1, 0)),
			pos = UDim2.new(0, 0, 0, 0),
			textTruncate = Enum.TextTruncate.AtEnd
		}),
		Publish = RoactModule.createElement(LegCell, {
			text = if Text == nil or Text == "" then "—" else Text,
			size = UDim2.new(_UDim4, UDim.new(1, 0)),
			pos = UDim2.new(_UDim3, UDim.new(0, 0))
		}),
		Subscribe = RoactModule.createElement(LegCell, {
			text = if Text == nil or Text == "" then "—" else Text,
			size = UDim2.new(_UDim4, UDim.new(1, 0)),
			pos = UDim2.new(_UDim3 + _UDim4, UDim.new(0, 0))
		})
	})
	local Formatted = if Connectivity.timeToConnectedMs and Connectivity.timeToConnectedMs > 0 then string.format("%.0f ms", Connectivity.timeToConnectedMs) else nil
	Frames.timeToConnectedRow = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 20),
		LayoutOrder = #list + 2
	}, {
		Label = RoactModule.createElement(CellLabelModule, {
			text = "Time to connected",
			size = UDim2.new(_UDim3, UDim.new(1, 0)),
			pos = UDim2.new(0, 0, 0, 0),
			textTruncate = Enum.TextTruncate.AtEnd
		}),
		Publish = RoactModule.createElement(LegCell, {
			text = if Formatted == nil or Formatted == "" then "—" else Formatted,
			size = UDim2.new(_UDim4, UDim.new(1, 0)),
			pos = UDim2.new(_UDim3, UDim.new(0, 0))
		}),
		Subscribe = RoactModule.createElement(LegCell, {
			text = if Formatted == nil or Formatted == "" then "—" else Formatted,
			size = UDim2.new(_UDim4, UDim.new(1, 0)),
			pos = UDim2.new(_UDim3 + _UDim4, UDim.new(0, 0))
		})
	})
	local FormatSelectedCandidatePairResult = formatSelectedCandidatePair(Connectivity.selectedCandidatePairLocalTypePublish, Connectivity.selectedCandidatePairRemoteTypePublish, Connectivity.selectedCandidatePairLocalProtocolPublish)
	local FormatSelectedCandidatePairResult1 = formatSelectedCandidatePair(Connectivity.selectedCandidatePairLocalTypeSubscribe, Connectivity.selectedCandidatePairRemoteTypeSubscribe, Connectivity.selectedCandidatePairLocalProtocolSubscribe)
	Frames.selectedCandidatePairRow = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 20),
		LayoutOrder = #list + 3
	}, {
		Label = RoactModule.createElement(CellLabelModule, {
			text = "Selected candidate pair",
			size = UDim2.new(_UDim3, UDim.new(1, 0)),
			pos = UDim2.new(0, 0, 0, 0),
			textTruncate = Enum.TextTruncate.AtEnd
		}),
		Publish = RoactModule.createElement(LegCell, {
			text = if FormatSelectedCandidatePairResult == nil or FormatSelectedCandidatePairResult == "" then "—" else FormatSelectedCandidatePairResult,
			size = UDim2.new(_UDim4, UDim.new(1, 0)),
			pos = UDim2.new(_UDim3, UDim.new(0, 0))
		}),
		Subscribe = RoactModule.createElement(LegCell, {
			text = if FormatSelectedCandidatePairResult1 == nil or FormatSelectedCandidatePairResult1 == "" then "—" else FormatSelectedCandidatePairResult1,
			size = UDim2.new(_UDim4, UDim.new(1, 0)),
			pos = UDim2.new(_UDim3 + _UDim4, UDim.new(0, 0))
		})
	})
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = LayoutOrder
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Title = FFlagVoiceDebugConsoleV2Module and RoactModule.createElement(GroupHeader, {
			title = "Transport state",
			subtitle = "publish / subscribe compared",
			layoutOrder = 1
		}) or RoactModule.createElement(CellLabelModule, {
			text = "Transport state",
			bold = true,
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			pos = UDim2.new()
		}),
		Header = RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}, if FFlagVoiceDebugConsoleV2Module then {
			Label = RoactModule.createElement(CellLabelModule, {
				text = "",
				size = UDim2.new(_UDim3, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			Publish = RoactModule.createElement(HeaderCell, {
				text = "Publish",
				size = UDim2.new(_UDim4, UDim.new(1, 0)),
				pos = UDim2.new(_UDim3, UDim.new(0, 0))
			}),
			Subscribe = RoactModule.createElement(HeaderCell, {
				text = "Subscribe",
				size = UDim2.new(_UDim4, UDim.new(1, 0)),
				pos = UDim2.new(_UDim3 + _UDim4, UDim.new(0, 0))
			})
		} else {
			Label = RoactModule.createElement(CellLabelModule, {
				text = "",
				size = UDim2.new(_UDim3, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			Publish = RoactModule.createElement(CellLabelModule, {
				text = "PUBLISH",
				bold = true,
				size = UDim2.new(_UDim4, UDim.new(1, 0)),
				pos = UDim2.new(_UDim3, UDim.new(0, 0))
			}),
			Subscribe = RoactModule.createElement(CellLabelModule, {
				text = "SUBSCRIBE",
				bold = true,
				size = UDim2.new(_UDim4, UDim.new(1, 0)),
				pos = UDim2.new(_UDim3 + _UDim4, UDim.new(0, 0))
			})
		}),
		Rows = RoactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Rows = RoactModule.createFragment(Frames)
		})
	})
end

local _ = function(p2): string --[[ Line: 401 | Named "formatMLineIndex" ]]
	local SdpMLineIndex = p2.sdpMLineIndex
	
	return if SdpMLineIndex == nil then "—" else tostring(SdpMLineIndex)
end

local _ = function(p2) --[[ Line: 409 | Named "formatOrDash" ]]
	return if p2 == nil or p2 == "" then "—" else p2
end

local function TypePill(p2) --[[ Line: 416 ]]
	-- upvalues: config3 (copy), config4 (copy), RoactModule (copy), ConstantsModule (copy)
	local CandidateType = p2.candidateType
	local Entry = CandidateType and config3[CandidateType] or config4
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p2.size,
		Position = p2.pos
	}, {
		Pill = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(0, 0, 0, 16),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = Entry.background
		}, {
			Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 7),
				PaddingRight = UDim.new(0, 7)
			}),
			Label = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = if CandidateType == nil or CandidateType == "" then "—" else CandidateType,
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = Enum.AutomaticSize.X,
				Font = ConstantsModule.Font.MainWindow,
				TextSize = ConstantsModule.DefaultFontSize.MainWindow - 2,
				TextColor3 = Entry.text,
				TextXAlignment = Enum.TextXAlignment.Center
			})
		})
	})
end

local t = {}

local _ = function(Key) --[[ Line: 459 | Named "parseIceCandidateCached" ]]
	-- upvalues: IceCandidateParserModule (copy), t (copy)
	if not Key then
		return IceCandidateParserModule(Key)
	end
	local Entry = t[Key]
	
	if Entry == nil then
		Entry = IceCandidateParserModule(Key)
		t[Key] = Entry
	end
	return Entry
end

local function CandidateTable(p2) --[[ Line: 471 ]]
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy), IceCandidateParserModule (copy), t (copy), RoactModule (copy), TypePill (copy), _UDim5 (copy), CellLabelModule (copy), _UDim6 (copy), _UDim7 (copy), _UDim8 (copy), _UDim9 (copy), _UDim10 (copy), _UDim (copy), _UDim1 (copy), _UDim2 (copy), HeaderCell (copy), GroupHeader (copy)
	local Title = p2.title
	local Candidates = p2.candidates or {}
	local LayoutOrder = p2.layoutOrder
	local FFlagVoiceDebugConsoleV2Module = GetFFlagVoiceDebugConsoleV2Module()
	local Frames = {}
	
	for LayoutOrder1, candidate in Candidates do
		if not FFlagVoiceDebugConsoleV2Module then
			local SdpMLineIndex = candidate.sdpMLineIndex
			Frames["candidate" .. LayoutOrder1] = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 20),
				LayoutOrder = LayoutOrder1
			}, {
				Candidate = RoactModule.createElement(CellLabelModule, {
					text = candidate.candidate,
					size = UDim2.new(_UDim, UDim.new(1, 0)),
					pos = UDim2.new(0, 0, 0, 0),
					textTruncate = Enum.TextTruncate.AtEnd
				}),
				SdpMid = RoactModule.createElement(CellLabelModule, {
					text = candidate.sdpMid,
					size = UDim2.new(_UDim1, UDim.new(1, 0)),
					pos = UDim2.new(_UDim, UDim.new(0, 0)),
					textTruncate = Enum.TextTruncate.AtEnd
				}),
				SdpMLineIndex = RoactModule.createElement(CellLabelModule, {
					text = if SdpMLineIndex == nil then "—" else tostring(SdpMLineIndex),
					size = UDim2.new(_UDim2, UDim.new(1, 0)),
					pos = UDim2.new(_UDim + _UDim1, UDim.new(0, 0))
				})
			})
			continue
		end
		local Candidate = candidate.candidate
		local IceCandidateParserModuleResult = nil
		
		if Candidate then
			local Entry = t[Candidate]
			
			if Entry == nil then
				Entry = IceCandidateParserModule(Candidate)
				t[Candidate] = Entry
			end
			IceCandidateParserModuleResult = Entry
		else
			IceCandidateParserModuleResult = IceCandidateParserModule(Candidate)
		end
		local Protocol = IceCandidateParserModuleResult.protocol
		local config = {
			text = if Protocol == nil or Protocol == "" then "—" else Protocol,
			size = UDim2.new(_UDim6, UDim.new(1, 0)),
			pos = UDim2.new(_UDim5, UDim.new(0, 0))
		}
		local Priority = IceCandidateParserModuleResult.priority
		local config1 = {
			text = if Priority == nil or Priority == "" then "—" else Priority,
			size = UDim2.new(_UDim7, UDim.new(1, 0)),
			pos = UDim2.new(_UDim5 + _UDim6, UDim.new(0, 0))
		}
		local Component = IceCandidateParserModuleResult.component
		local config2 = {
			text = if Component == nil or Component == "" then "—" else Component,
			size = UDim2.new(_UDim8, UDim.new(1, 0)),
			pos = UDim2.new(_UDim5 + _UDim6 + _UDim7, UDim.new(0, 0))
		}
		local SdpMid = candidate.sdpMid
		local config3 = {
			text = if SdpMid == nil or SdpMid == "" then "—" else SdpMid,
			size = UDim2.new(_UDim9, UDim.new(1, 0)),
			pos = UDim2.new(_UDim5 + _UDim6 + _UDim7 + _UDim8, UDim.new(0, 0)),
			textTruncate = Enum.TextTruncate.AtEnd
		}
		local SdpMLineIndex = candidate.sdpMLineIndex
		Frames["candidate" .. LayoutOrder1] = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20),
			LayoutOrder = LayoutOrder1
		}, {
			Type = RoactModule.createElement(TypePill, {
				candidateType = IceCandidateParserModuleResult.candidateType,
				size = UDim2.new(_UDim5, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			Proto = RoactModule.createElement(CellLabelModule, config),
			Priority = RoactModule.createElement(CellLabelModule, config1),
			Comp = RoactModule.createElement(CellLabelModule, config2),
			Mid = RoactModule.createElement(CellLabelModule, config3),
			Idx = RoactModule.createElement(CellLabelModule, {
				text = if SdpMLineIndex == nil then "—" else tostring(SdpMLineIndex),
				size = UDim2.new(_UDim10, UDim.new(1, 0)),
				pos = UDim2.new(_UDim5 + _UDim6 + _UDim7 + _UDim8 + _UDim9, UDim.new(0, 0))
			})
		})
	end
	if next(Frames) == nil then
		Frames.placeholder = RoactModule.createElement(CellLabelModule, {
			text = "—",
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			pos = UDim2.new()
		})
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = LayoutOrder
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Title = FFlagVoiceDebugConsoleV2Module and RoactModule.createElement(GroupHeader, {
			layoutOrder = 1,
			title = Title,
			subtitle = string.format("%d local", #Candidates)
		}) or RoactModule.createElement(CellLabelModule, {
			bold = true,
			layoutOrder = 1,
			text = Title,
			size = UDim2.new(1, 0, 0, 20),
			pos = UDim2.new()
		}),
		Header = if FFlagVoiceDebugConsoleV2Module then RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}, {
			Type = RoactModule.createElement(HeaderCell, {
				text = "Type",
				size = UDim2.new(_UDim5, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			Proto = RoactModule.createElement(HeaderCell, {
				text = "Proto",
				size = UDim2.new(_UDim6, UDim.new(1, 0)),
				pos = UDim2.new(_UDim5, UDim.new(0, 0))
			}),
			Priority = RoactModule.createElement(HeaderCell, {
				text = "Priority",
				size = UDim2.new(_UDim7, UDim.new(1, 0)),
				pos = UDim2.new(_UDim5 + _UDim6, UDim.new(0, 0))
			}),
			Comp = RoactModule.createElement(HeaderCell, {
				text = "Comp",
				size = UDim2.new(_UDim8, UDim.new(1, 0)),
				pos = UDim2.new(_UDim5 + _UDim6 + _UDim7, UDim.new(0, 0))
			}),
			Mid = RoactModule.createElement(HeaderCell, {
				text = "Mid",
				size = UDim2.new(_UDim9, UDim.new(1, 0)),
				pos = UDim2.new(_UDim5 + _UDim6 + _UDim7 + _UDim8, UDim.new(0, 0))
			}),
			Idx = RoactModule.createElement(HeaderCell, {
				text = "Idx",
				size = UDim2.new(_UDim10, UDim.new(1, 0)),
				pos = UDim2.new(_UDim5 + _UDim6 + _UDim7 + _UDim8 + _UDim9, UDim.new(0, 0))
			})
		}) else RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}, {
			Candidate = RoactModule.createElement(CellLabelModule, {
				text = "CANDIDATE",
				bold = true,
				size = UDim2.new(_UDim, UDim.new(1, 0)),
				pos = UDim2.new(0, 0, 0, 0)
			}),
			SdpMid = RoactModule.createElement(CellLabelModule, {
				text = "SDP MID",
				bold = true,
				size = UDim2.new(_UDim1, UDim.new(1, 0)),
				pos = UDim2.new(_UDim, UDim.new(0, 0))
			}),
			SdpMLineIndex = RoactModule.createElement(CellLabelModule, {
				text = "SDP MLINE INDEX",
				bold = true,
				size = UDim2.new(_UDim2, UDim.new(1, 0)),
				pos = UDim2.new(_UDim + _UDim1, UDim.new(0, 0))
			})
		}),
		Rows = RoactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
			Rows = RoactModule.createFragment(Frames)
		})
	})
end

local _ = function(Text: string) --[[ Line: 674 | Named "toRichTextSdp" ]]
	return if Text == nil then nil else string.gsub(string.gsub(Text, "[<>&\"']", {
		["<"] = "&lt;",
		[">"] = "&gt;",
		["&"] = "&amp;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	}), "redacted", string.format("<font color=\"#%s\">redacted</font>", "6B6F75"))
end

local SdpSection = RoactModule.PureComponent:extend("SdpSection")

function SdpSection.init(p3) --[[ Line: 689 ]]
	p3.state = { expanded = false }
	
	function p3.onButtonPress() --[[ Line: 694 ]]
		-- upvalues: p3 (copy)
		p3:setState(function(p4) --[[ Line: 695 ]]
			return { expanded = not p4.expanded }
		end)
	end
end

function SdpSection.render(p3) --[[ Line: 703 ]]
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy), RoactModule (copy), BannerButtonModule (copy), CellLabelModule (copy), ConstantsModule (copy)
	local Label = p3.props.label
	local Sdp: string = p3.props.sdp
	local LayoutOrder = p3.props.layoutOrder
	local FFlagVoiceDebugConsoleV2Module = GetFFlagVoiceDebugConsoleV2Module()
	local IsNotSdpMatch: boolean = Sdp ~= nil and Sdp ~= ""
	local Replaced = FFlagVoiceDebugConsoleV2Module and IsNotSdpMatch and (if Sdp == nil then nil else string.gsub(string.gsub(Sdp, "[<>&\"']", {
		["<"] = "&lt;",
		[">"] = "&gt;",
		["&"] = "&amp;",
		["\""] = "&quot;",
		["'"] = "&apos;"
	}), "redacted", string.format("<font color=\"#%s\">redacted</font>", "6B6F75"))) or Sdp
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = LayoutOrder
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Button = RoactModule.createElement(BannerButtonModule, {
			hideLines = true,
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			isExpanded = p3.state.expanded,
			isExpandable = IsNotSdpMatch,
			onButtonPress = IsNotSdpMatch and p3.onButtonPress or nil
		}, {
			Label = RoactModule.createElement(CellLabelModule, {
				text = IsNotSdpMatch and Label or string.format("%s: —", Label),
				size = UDim2.new(1, -20, 1, 0),
				pos = UDim2.new(0, 20, 0, 0)
			})
		}),
		Content = IsNotSdpMatch and p3.state.expanded and RoactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Text = Replaced,
			RichText = FFlagVoiceDebugConsoleV2Module,
			TextSize = FFlagVoiceDebugConsoleV2Module and ConstantsModule.DefaultFontSize.MainWindow - 3 or ConstantsModule.DefaultFontSize.MainWindow,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			Font = ConstantsModule.Font.MainWindow,
			Size = UDim2.new(1, -20, 0, 0),
			Position = UDim2.new(0, 20, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}) or nil
	})
end

return function(p3) --[[ Line: 757 | Named "ConnectivityPanel" ]]
	-- upvalues: GetFFlagVoiceDebugConsoleV2Module (copy), RoactModule (copy), TransportStateTable (copy), CandidateTable (copy), GroupHeader (copy), SdpSection (copy), CollapsibleSectionModule (copy), MainRowPadding (copy), CellLabelModule (copy)
	local Connectivity = p3.connectivity or {}
	local LayoutOrder = p3.layoutOrder
	local FFlagVoiceDebugConsoleV2Module = GetFFlagVoiceDebugConsoleV2Module()
	local config = {
		TransportState = FFlagVoiceDebugConsoleV2Module and RoactModule.createElement(TransportStateTable, { layoutOrder = 1, connectivity = Connectivity }) or nil,
		PublishCandidates = RoactModule.createElement(CandidateTable, {
			title = "Publish ICE candidates",
			layoutOrder = 2,
			candidates = Connectivity.icePublishCandidates
		}),
		SubscribeCandidates = RoactModule.createElement(CandidateTable, {
			title = "Subscribe ICE candidates",
			layoutOrder = 3,
			candidates = Connectivity.iceSubscribeCandidates
		}),
		SessionDescriptionsHeader = FFlagVoiceDebugConsoleV2Module and RoactModule.createElement(GroupHeader, {
			title = "Session descriptions",
			subtitle = "addresses redacted",
			layoutOrder = 4
		}) or nil,
		PublishOffer = RoactModule.createElement(SdpSection, {
			label = "Publish offer",
			layoutOrder = 5,
			sdp = Connectivity.sdpPublishOffer
		}),
		PublishRemoteAnswer = RoactModule.createElement(SdpSection, {
			label = "Publish remote answer",
			layoutOrder = 6,
			sdp = Connectivity.sdpPublishRemoteAnswer
		}),
		SubscribeRemoteOffer = RoactModule.createElement(SdpSection, {
			label = "Subscribe remote offer",
			layoutOrder = 7,
			sdp = Connectivity.sdpSubscribeRemoteOffer
		}),
		SubscribeAnswer = RoactModule.createElement(SdpSection, {
			label = "Subscribe answer",
			layoutOrder = 8,
			sdp = Connectivity.sdpSubscribeAnswer
		})
	}
	
	if FFlagVoiceDebugConsoleV2Module then
		return RoactModule.createElement(CollapsibleSectionModule, { title = "Connectivity", layoutOrder = LayoutOrder }, config)
	else
		config.UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, MainRowPadding)
		})
		config.SectionHeader = RoactModule.createElement(CellLabelModule, {
			text = "CONNECTIVITY",
			bold = true,
			layoutOrder = 0,
			size = UDim2.new(1, 0, 0, 20),
			pos = UDim2.new()
		})
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = LayoutOrder
		}, config)
	end
end