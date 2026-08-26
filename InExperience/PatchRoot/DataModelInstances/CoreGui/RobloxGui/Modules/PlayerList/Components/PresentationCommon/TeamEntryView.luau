local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local useLayoutValues = playerListModule.Common.useLayoutValues
local useStyle = UIBloxModule.Core.Style.useStyle
local entryFrameView = playerListModule.Presentation.EntryFrameView
local statEntryContainerModule = require(parent_1.Components.Container.StatEntryContainer)
local fFlagPlayerListFixLeaderstatsStacking = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local cellExtenderModule = require(parent.Presentation.CellExtender)

return reactModule.memo(function(p1)
	-- upvalues: useLayoutValues (ref), useStyle (ref), fFlagEnableMobilePlayerListOnConsole (ref), reactModule (ref), fFlagPlayerListFixLeaderstatsStacking (ref), signalsReactModule (ref), statEntryContainerModule (ref), entryFrameView (ref), cellExtenderModule (ref)
	local var1 = useLayoutValues()
	local var2 = useStyle()
	local isSmallTouchDevice = p1.isSmallTouchDevice or false
	local isDirectionalPreferred = p1.isDirectionalPreferred or false
	local textEmphasis = var2.Theme.TextEmphasis
	local var3 = if fFlagEnableMobilePlayerListOnConsole then var1.TeamNameTextSize else var2.Font.CaptionHeader.RelativeSize * var2.Font.BaseSize
	local font = var2.Font.CaptionHeader.Font
	
	if isDirectionalPreferred then
		textEmphasis = var1.DefaultTextStyle
		var3 = var1.PlayerNameTextSize
		font = var1.TeamEntryFont
	end
	local var4 = reactModule.useMemo(function()
		-- upvalues: isSmallTouchDevice (ref), var2 (ref), p1 (ref), isDirectionalPreferred (ref), var1 (ref)
		return if isSmallTouchDevice then {
			Color = p1.teamColor,
			Transparency = var2.Settings.PreferredTransparency * 0.5
		} elseif isDirectionalPreferred then {
			Color = p1.teamColor,
			Transparency = if var1.BackgroundStyle then var1.BackgroundStyle.Default.Transparency else 0
		} else {
			Color = p1.teamColor,
			Transparency = var1.TeamEntryBackgroundTransparency * var2.Settings.PreferredTransparency
		}
	end, {
		isSmallTouchDevice,
		isDirectionalPreferred,
		p1.teamColor,
		var2,
		var1
	})
	local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
	local maxLeaderstats = var1.MaxLeaderstats
	local var5 = if fFlagPlayerListFixLeaderstatsStacking then signalsReactModule.useSignalState(p1.gameStats.getAllData) else nil
	
	if isSmallTouchDevice then
		local t_1 = {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			NameFrame = reactModule.createElement("TextLabel", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, var1.PlayerNameSizeXMobile, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Font = font,
				TextSize = var3,
				TextColor3 = textEmphasis.Color,
				TextStrokeTransparency = textEmphasis.StrokeTransparency,
				TextStrokeColor3 = textEmphasis.StrokeColor,
				Text = p1.teamName,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, var1.TeamEntryTextPaddingMobile)
				})
			})
		}
		
		if fFlagPlayerListFixLeaderstatsStacking then
			for i, v in var5 do
				if maxLeaderstats >= v.order(false) then
					t_1["GameStat_" .. i] = reactModule.createElement(statEntryContainerModule, {
						isTeamEntry = true,
						showStatTitle = false,
						statName = i,
						stat = p1.teamStats.getData(i, false),
						textStyle = textEmphasis
					})
				end
			end
		elseif p1.gameStatsCount and p1.teamStatsCount and (p1.gameStatsCount > 0 and p1.teamStatsCount >= 0) then
			p1.gameStats.iterateData(function(p2, p3)
				-- upvalues: maxLeaderstats (ref), p1 (ref), t_1 (ref), reactModule (copy), statEntryContainerModule (copy), textEmphasis (write)
				if maxLeaderstats < p3.order(false) then
					return
				end
				t_1["GameStat_" .. p1] = reactModule.createElement(statEntryContainerModule, {
					isTeamEntry = true,
					showStatTitle = false,
					statName = p2,
					stat = p1.teamStats.getData(p2, false),
					textStyle = textEmphasis
				})
			end, false)
		end
		return reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			GroupTransparency = nil,
			LayoutOrder = p1.layoutOrder,
			Size = p1.size,
			BackgroundColor3 = var4.Color,
			BackgroundTransparency = var4.Transparency
		}, t_1)
	else
		local t_1 = {
			UIListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = if isDirectionalPreferred then UDim.new(0, var1.PlayerEntryPadding) else nil
			}),
			NameFrame = reactModule.createElement("Frame", {
				LayoutOrder = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, p1.entrySizeX, 0, var1.TeamEntrySizeY)
			}, {
				Shadow = reactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Image = var1.ShadowImage,
					Position = UDim2.new(0, -var1.ShadowSize, 0, 0),
					Size = UDim2.new(1, var1.ShadowSize * 2, 1, var1.ShadowSize),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = var1.ShadowSliceRect,
					Visible = isDirectionalPreferred
				}),
				BGFrame = reactModule.createElement(entryFrameView, {
					isTeamFrame = true,
					doubleOverlay = false,
					size = UDim2.new(0, p1.entrySizeX, 0, var1.TeamEntrySizeY),
					backgroundStyle = var4,
					overlayStyle = t
				}, {
					TeamName = reactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 0, 0, 0),
						Size = UDim2.new(1, 0, 1, 0),
						TextXAlignment = Enum.TextXAlignment.Left,
						Font = font,
						TextSize = var3,
						TextColor3 = textEmphasis.Color,
						TextStrokeTransparency = textEmphasis.StrokeTransparency,
						TextStrokeColor3 = textEmphasis.StrokeColor,
						Text = p1.teamName,
						TextTruncate = Enum.TextTruncate.AtEnd
					}, {
						reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var1.TeamEntryTextPadding) })
					})
				})
			})
		}
		
		if fFlagPlayerListFixLeaderstatsStacking then
			for i, v in var5 do
				if maxLeaderstats >= v.order(false) then
					t_1["GameStat_" .. i] = reactModule.createElement(statEntryContainerModule, {
						isTeamEntry = true,
						showStatTitle = false,
						doubleOverlay = false,
						statName = i,
						stat = p1.teamStats.getData(i, false),
						backgroundStyle = var4,
						overlayStyle = t,
						textStyle = textEmphasis
					})
				end
			end
		elseif p1.gameStatsCount and p1.teamStatsCount and (p1.gameStatsCount > 0 and p1.teamStatsCount >= 0) then
			p1.gameStats.iterateData(function(p2, p3)
				-- upvalues: maxLeaderstats (ref), p1 (ref), t_1 (ref), reactModule (copy), statEntryContainerModule (copy), var4 (ref), t (ref), textEmphasis (write)
				if maxLeaderstats < p3.order(false) then
					return
				end
				t_1["GameStat_" .. p3] = reactModule.createElement(statEntryContainerModule, {
					isTeamEntry = true,
					showStatTitle = false,
					doubleOverlay = false,
					statName = p2,
					stat = p1.teamStats.getData(p2, false),
					backgroundStyle = var4,
					overlayStyle = t,
					textStyle = textEmphasis
				})
			end, false)
		end
		if not isDirectionalPreferred then
			t_1.BackgroundExtender = reactModule.createElement(cellExtenderModule, {
				layoutOrder = 100,
				doubleOverlay = false,
				size = UDim2.new(0, var1.ExtraContainerPadding, 1, 0),
				backgroundStyle = var4,
				overlayStyle = t
			})
		end
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			GroupTransparency = nil,
			Size = p1.size,
			BackgroundColor3 = Color3.new(1, 1, 1),
			LayoutOrder = p1.layoutOrder
		}, t_1)
	end
end)