local TextService = game:GetService("TextService")
local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetMessageTextSizeFunction = require(Parent.ChatUIPrimitives).Utils.getMessageTextSize
local UseFinishChatWindowMessageRenderIntervalsFunction = require(Parent.ChatUIPrimitives).Hooks.useFinishChatWindowMessageRenderIntervals
local _ = require(script.Parent.MessageDisplayStore.useMessageDisplayStore)

local function _(p1: number, p2): number
	return p1 + p2 * (1 - p1)
end

local _ = function(p1): boolean
	return p1 ~= nil and p1.displayStyle == "system"
end

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), GetMessageTextSizeFunction (copy), ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), UseFinishChatWindowMessageRenderIntervalsFunction (copy), TextService (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ChatWindowSettings = p1.chatWindowSettings
	local FontFace = (if ChatWindowSettings then ChatWindowSettings.FontFace else nil) or UseTokensResult.Typography.BodySmall.Font
	local FontFace1 = if typeof(FontFace) == "Font" then FontFace else Font.fromEnum(FontFace)
	local _Font = Font.new(FontFace1.Family, Enum.FontWeight.SemiBold, FontFace1.Style)
	local MessageTextSize = GetMessageTextSizeFunction(ChatWindowSettings, p1.isSpatialUIEnabled) or UseTokensResult.Typography.BodySmall.FontSize
	local Largest = math.max(1, MessageTextSize - 2)
	local TextColor3 = if ChatWindowSettings and ChatWindowSettings.TextColor3 then ChatWindowSettings.TextColor3 else UseTokensResult.Color.Content.Default.Color3
	local MutedColor3 = UseTokensResult.Color.Content.Muted.Color3
	local TextStrokeColor3 = if ChatWindowSettings then ChatWindowSettings.TextStrokeColor3 else nil
	local TextStrokeTransparency = if ChatWindowSettings and ChatWindowSettings.TextStrokeTransparency then ChatWindowSettings.TextStrokeTransparency else 1
	local TextTransparency = p1.textTransparency or ReactModule.createBinding(0)
	local GetDisplayIdFunction = p1.getDisplayId
	local GetDisplayFromIdFunction = p1.getDisplayFromId
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetDisplayFromIdFunction (copy), GetDisplayIdFunction (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetDisplayFromIdFunction (upval), GetDisplayIdFunction (upval)
			return GetDisplayFromIdFunction(GetDisplayIdFunction(p2), p2)
		end)
	end, { GetDisplayIdFunction, GetDisplayFromIdFunction })))
	local UseSignalBindingResult1 = SignalsReactModule.useSignalBinding(p1.getLayoutOrder)
	local UseFinishChatWindowMessageRenderIntervalsResult = UseFinishChatWindowMessageRenderIntervalsFunction((ReactModule.useCallback(function()
		-- upvalues: GetDisplayIdFunction (copy)
		return GetDisplayIdFunction(false)
	end, { GetDisplayIdFunction })))
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseFinishChatWindowMessageRenderIntervalsResult (copy)
		if p2 and p2.Text and p2.Text ~= "" then
			UseFinishChatWindowMessageRenderIntervalsResult()
		end
	end, { UseFinishChatWindowMessageRenderIntervalsResult })
	local UseMemoResult = ReactModule.useMemo(function(): UDim2
		-- upvalues: MessageTextSize (copy)
		return UDim2.fromOffset(math.floor(MessageTextSize * 3 / 2), MessageTextSize)
	end, { MessageTextSize })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UseMemoResult)
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2 (copy), UseMemoResult (copy)
		UseBindingResult2(UseMemoResult)
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: FontFace1 (copy), MessageTextSize (copy), TextService (upval), UseBindingResult2 (copy)
		local Flag = false
		task.spawn(function()
			-- upvalues: FontFace1 (upval), MessageTextSize (upval), TextService (upval), Flag (ref), UseBindingResult2 (upval)
			local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
			GetTextBoundsParams.Text = "          "
			GetTextBoundsParams.Font = FontFace1
			GetTextBoundsParams.Size = MessageTextSize
			GetTextBoundsParams.Width = 1e999
			local Success, Result = pcall(function()
				-- upvalues: TextService (upval), GetTextBoundsParams (copy)
				return TextService:GetTextBoundsAsync(GetTextBoundsParams)
			end)
			
			if not Flag and Success and Result ~= nil then
				UseBindingResult2(UDim2.fromOffset(Result.X, Result.Y))
				
				return
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { FontFace1, MessageTextSize })
	local config = {
		hasStroke = true,
		font = FontFace1,
		textSize = MessageTextSize,
		textColor = TextColor3
	}
	local config1 = {
		hasStroke = false,
		font = _Font,
		textSize = Largest,
		textColor = MutedColor3
	}
	local MapResult = UseSignalBindingResult:map(function(p2)
		-- upvalues: config1 (copy), config (copy)
		local IsSystem: boolean = p2 ~= nil and p2.displayStyle == "system"
		
		return if IsSystem then config1 else config
	end)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = UseSignalBindingResult1,
		Visible = UseSignalBindingResult:map(function(p2): boolean
			return p2 ~= nil
		end)
	}, {
		body = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			FontFace = MapResult:map(function(p2)
				return p2.font
			end),
			TextSize = MapResult:map(function(p2)
				return p2.textSize
			end),
			TextColor3 = MapResult:map(function(p2)
				return p2.textColor
			end),
			TextStrokeColor3 = TextStrokeColor3,
			TextStrokeTransparency = ReactModule.joinBindings({ style = MapResult, textTransparency = TextTransparency }):map(function(p2): number
				-- upvalues: TextStrokeTransparency (copy)
				return if p2.style.hasStroke then TextStrokeTransparency + p2.textTransparency * (1 - TextStrokeTransparency) else 1
			end),
			TextTransparency = TextTransparency,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			RichText = true,
			Text = UseSignalBindingResult:map(function(p2)
				return if p2 == nil then "" elseif p2.skeletonWidth == "prefix" then `          {p2.content}` else p2.content
			end),
			[ReactModule.Change.Text] = UseResult
		}),
		skeleton = ReactModule.createElement(FoundationModule.Skeleton, {
			Size = ReactModule.joinBindings({
				display = UseSignalBindingResult,
				placeholder = UseBindingResult
			}):map(function(p2)
				local Display = p2.display
				
				return if Display == nil or Display.skeletonWidth ~= "full" then p2.placeholder else UDim2.new(1, 0, 0, p2.placeholder.Y.Offset)
			end),
			Position = UDim2.fromOffset(0, 0),
			AnchorPoint = Vector2.new(0, 0),
			Visible = ReactModule.joinBindings({
				display = UseSignalBindingResult,
				textTransparency = TextTransparency
			}):map(function(p2): boolean
				if p2.textTransparency >= 0.9 then
					return false
				else
					local Display = p2.display
					
					return Display ~= nil and (Display.skeletonWidth == "prefix" or Display.skeletonWidth == "full")
				end
			end)
		})
	})
end)