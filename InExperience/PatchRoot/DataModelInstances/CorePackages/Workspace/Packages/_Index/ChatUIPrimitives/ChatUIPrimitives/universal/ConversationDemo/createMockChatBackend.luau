local HttpService = game:GetService("HttpService")
local SignalsModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.Signals)
local PlainTextContentModelModule = require(script.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel)
local PresetContentModelModule = require(script.Parent.Parent.ContentKinds.Preset.PresetContentModel)
local EmojiContentModelModule = require(script.Parent.Parent.ContentKinds.Emoji.EmojiContentModel)
local MessageEnvelopeModelModule = require(script.Parent.Parent.MessageEnvelopeModel)
local MessageModelModule = require(script.Parent.Parent.MessageModel)
local _ = require(script.Parent.Parent.Types)
local Frozen = table.freeze({
	{ userId = "1", displayName = "Roblox" },
	{ userId = "156", displayName = "Builderman" }
})

local function _(Text)
	return { kind = "plainText", text = Text }
end

local _ = function(PresetId, DisplayText)
	return {
		kind = "preset",
		presetId = PresetId,
		displayText = DisplayText
	}
end

local _ = function(EmojiId, Unicode)
	return { kind = "emoji", emojiId = EmojiId, unicode = Unicode }
end

local Frozen1 = table.freeze({
	"Switching to Bright blue, red team is stacked",
	"Who just bloxxed me off the tower??",
	"12 KOs and still top of the leaderboard, come get me",
	"gg! Sending you a friend request", "Where is everyone? The map is empty",
	"/regen the bridge is gone again", "Anyone on yellow want to team up?",
	"Got bloxxed by my own rocket lol", "Meet at the middle tower, bring a sword",
	"Friend request sent, let's run it back", "Changing teams, green has nobody",
	"Who keeps blowing up the house? /regen"
})
local Frozen2 = table.freeze({
	{ kind = "plainText", text = Frozen1[1] },
	{ kind = "plainText", text = Frozen1[2] },
	{ kind = "plainText", text = Frozen1[3] },
	{ kind = "plainText", text = Frozen1[4] },
	{ kind = "plainText", text = Frozen1[5] },
	{ kind = "plainText", text = Frozen1[6] },
	{ kind = "plainText", text = Frozen1[7] },
	{ kind = "plainText", text = Frozen1[8] },
	{ kind = "plainText", text = Frozen1[9] },
	{ kind = "plainText", text = Frozen1[10] },
	{ kind = "plainText", text = Frozen1[11] },
	{ kind = "plainText", text = Frozen1[12] },
	{
		kind = "preset",
		presetId = "hello",
		displayText = "Hello"
	},
	{ kind = "preset", presetId = "gg", displayText = "gg" },
	{
		kind = "emoji",
		emojiId = "party-popper",
		unicode = "🎉"
	}
})

local function acceptedSendOf(p1)
	-- upvalues: PlainTextContentModelModule (copy), PresetContentModelModule (copy), EmojiContentModelModule (copy)
	local Content = p1.contents[1]
	
	if Content == nil then
		return nil
	end
	local Draft = PlainTextContentModelModule.getDraft(Content)
	
	if Draft ~= nil then
		return if Draft.text == "" then nil else { kind = "plainText", text = Draft.text }
	end
	local Draft1 = PresetContentModelModule.getDraft(Content)
	
	if Draft1 == nil then
		local Draft2 = EmojiContentModelModule.getDraft(Content)
		
		return if Draft2 == nil then nil elseif Draft2.emojiId == "" or Draft2.unicode == "" then nil else {
			kind = "emoji",
			emojiId = Draft2.emojiId,
			unicode = Draft2.unicode
		}
	else
		return if Draft1.presetId == "" or Draft1.displayText == "" then nil else {
			kind = "preset",
			presetId = Draft1.presetId,
			displayText = Draft1.displayText
		}
	end
end

return {
	incomingIntervalSeconds = 2,
	welcomeText = "Welcome to Crossroads! Type /regen if someone wrecks the map.",
	create = function(UserId, p1)
		-- upvalues: SignalsModule (copy), MessageModelModule (copy), MessageEnvelopeModelModule (copy), Frozen (copy), acceptedSendOf (copy), HttpService (copy), Frozen2 (copy)
		local config = { displayName = "You", userId = UserId }
		local _Random = Random.new()
		
		local function _(p2, p3)
			-- upvalues: p1 (copy), _Random (copy)
			local _Random1 = if p1 then p1.random else nil
			
			return if _Random1 then _Random1:NextInteger(p2, p3) else _Random:NextInteger(p2, p3)
		end
		
		local _ = function(p2)
			-- upvalues: p1 (copy), _Random (copy)
			local CountP10 = #p2
			local _Random1 = if p1 then p1.random else nil
			
			return p2[if _Random1 then _Random1:NextInteger(1, CountP10) else _Random:NextInteger(1, CountP10)]
		end
		
		local Signal, Signal2 = SignalsModule.createSignal({})
		local Tbl = {}
		local Largest = 0
		
		local _ = function()
			-- upvalues: p1 (copy)
			local GetNowMs = if p1 then p1.getNowMs else nil
			
			return if GetNowMs then GetNowMs() else DateTime.now().UnixTimestampMillis
		end
		
		local _ = function(p3)
			-- upvalues: Signal (copy), Signal2 (copy)
			local Copy = table.clone(Signal(false))
			table.insert(Copy, p3)
			Signal2(Copy)
		end
		
		local _ = function(): number
			-- upvalues: Largest (ref), p1 (copy)
			local GetNowMs = if p1 then p1.getNowMs else nil
			Largest = math.max(if GetNowMs then GetNowMs() else DateTime.now().UnixTimestampMillis, Largest + 1)
			
			return Largest
		end
		
		local _ = function(p3, Author, SentAtUnixMilliseconds)
			-- upvalues: MessageModelModule (upval), Largest (ref), p1 (copy)
			local FromPlainTextFunction = MessageModelModule.fromPlainText
			local t = {}
			local SentAtUnixMilliseconds1: number = SentAtUnixMilliseconds
			
			if not SentAtUnixMilliseconds1 then
				local GetNowMs = if p1 then p1.getNowMs else nil
				Largest = math.max(if GetNowMs then GetNowMs() else DateTime.now().UnixTimestampMillis, Largest + 1)
				SentAtUnixMilliseconds1 = Largest
			end
			t.sentAtUnixMilliseconds = SentAtUnixMilliseconds1
			t.author = Author
			
			return FromPlainTextFunction(p3, t)
		end
		
		local function messageFromAcceptedSend(p3, Author, Largest1)
			-- upvalues: Largest (ref), p1 (copy), MessageModelModule (upval)
			local t = {}
			local SentAtUnixMilliseconds: number = Largest1
			
			if not SentAtUnixMilliseconds then
				local GetNowMs = if p1 then p1.getNowMs else nil
				Largest = math.max(if GetNowMs then GetNowMs() else DateTime.now().UnixTimestampMillis, Largest + 1)
				SentAtUnixMilliseconds = Largest
			end
			t.sentAtUnixMilliseconds = SentAtUnixMilliseconds
			t.author = Author
			
			return if p3.kind == "preset" then MessageModelModule.fromPreset(p3.presetId, p3.displayText, t) elseif p3.kind == "emoji" then MessageModelModule.fromEmoji(p3.emojiId, p3.unicode, t) else MessageModelModule.fromPlainText(p3.text, t)
		end
		
		local _ = function(p3)
			-- upvalues: MessageEnvelopeModelModule (upval), Signal (copy), Signal2 (copy)
			local IncomingResult = MessageEnvelopeModelModule.incoming(p3)
			local Copy = table.clone(Signal(false))
			table.insert(Copy, IncomingResult)
			Signal2(Copy)
		end
		
		local CountFrozen = #Frozen
		local _Random1 = if p1 then p1.random else nil
		local GetNowMs = if p1 then p1.getNowMs else nil
		Largest = math.max(if GetNowMs then GetNowMs() else DateTime.now().UnixTimestampMillis, Largest + 1)
		local IncomingResult = MessageEnvelopeModelModule.incoming((MessageModelModule.fromPlainText("Welcome to Crossroads! Type /regen if someone wrecks the map.", {
			sentAtUnixMilliseconds = Largest,
			author = Frozen[if _Random1 then _Random1:NextInteger(1, CountFrozen) else _Random:NextInteger(1, CountFrozen)]
		})))
		local Copy = table.clone(Signal(false))
		table.insert(Copy, IncomingResult)
		Signal2(Copy)
		
		local function replaceEnvelope(Guid, Callback)
			-- upvalues: Signal (copy), Signal2 (copy)
			local SignalResult = Signal(false)
			local Copy = table.clone(SignalResult)
			
			for i, value in SignalResult do
				if value.stableId == Guid then
					Copy[i] = Callback(value)
					Signal2(Copy)
					break
				end
			end
		end
		
		local _ = function()
			-- upvalues: Frozen2 (upval), p1 (copy), _Random (copy), Frozen (upval), messageFromAcceptedSend (copy), MessageEnvelopeModelModule (upval), Signal (copy), Signal2 (copy)
			local CountFrozen2 = #Frozen2
			local _Random1 = if p1 then p1.random else nil
			local FrozenEntry = Frozen2[if _Random1 then _Random1:NextInteger(1, CountFrozen2) else _Random:NextInteger(1, CountFrozen2)]
			local CountFrozen = #Frozen
			local _Random2 = if p1 then p1.random else nil
			local IncomingResult = MessageEnvelopeModelModule.incoming((messageFromAcceptedSend(FrozenEntry, Frozen[if _Random2 then _Random2:NextInteger(1, CountFrozen) else _Random:NextInteger(1, CountFrozen)])))
			local Copy = table.clone(Signal(false))
			table.insert(Copy, IncomingResult)
			Signal2(Copy)
		end
		
		return {
			getMessageEnvelopes = Signal,
			sendMessageDraft = function(p3)
				-- upvalues: acceptedSendOf (upval), HttpService (upval), Largest (ref), p1 (copy), MessageEnvelopeModelModule (upval), config (copy), Signal (copy), Signal2 (copy), Tbl (copy), replaceEnvelope (copy), messageFromAcceptedSend (copy)
				local AcceptedSendOfResult = acceptedSendOf(p3)
				
				if AcceptedSendOfResult ~= nil then
					local Guid = HttpService:GenerateGUID(false)
					local GetNowMs = if p1 then p1.getNowMs else nil
					Largest = math.max(if GetNowMs then GetNowMs() else DateTime.now().UnixTimestampMillis, Largest + 1)
					local Largest1: number = Largest
					local DeliveryOutcome = if p1 then p1.deliveryOutcome else nil
					local DeliveryDelaySeconds = if p1 then p1.deliveryDelaySeconds else nil
					local SendingResult = MessageEnvelopeModelModule.sending(Guid, p3, config, Largest1)
					local Copy = table.clone(Signal(false))
					table.insert(Copy, SendingResult)
					Signal2(Copy)
					local DeferredThread = nil
					
					local function resolveDelivery()
						-- upvalues: Tbl (upval), DeferredThread (ref), replaceEnvelope (upval), Guid (copy), p1 (upval), DeliveryOutcome (copy), MessageEnvelopeModelModule (upval), messageFromAcceptedSend (upval), AcceptedSendOfResult (copy), config (upval), Largest1 (copy)
						Tbl[DeferredThread] = nil
						replaceEnvelope(Guid, function(p4)
							-- upvalues: p1 (upval), DeliveryOutcome (upval), MessageEnvelopeModelModule (upval), messageFromAcceptedSend (upval), AcceptedSendOfResult (upval), config (upval), Largest1 (upval)
							if p4.direction == "outgoing" and p4.payload.kind == "draft" and p4.delivery.state == "sending" then
								local GetNowMs = if p1 then p1.getNowMs else nil
								local Largest = math.max(if GetNowMs then GetNowMs() else DateTime.now().UnixTimestampMillis, p4.delivery.attemptedAtUnixMilliseconds)
								
								return if DeliveryOutcome == "fail" then MessageEnvelopeModelModule.failed(p4, Largest) else MessageEnvelopeModelModule.acknowledged(p4, messageFromAcceptedSend(AcceptedSendOfResult, config, Largest1), Largest)
							else
								return p4
							end
						end)
					end
					
					DeferredThread = if DeliveryDelaySeconds == nil then task.defer(resolveDelivery) else task.delay(DeliveryDelaySeconds, resolveDelivery)
					Tbl[DeferredThread] = true
					
					return
				end
			end,
			startIncomingTraffic = function()
				-- upvalues: Frozen2 (upval), p1 (copy), _Random (copy), Frozen (upval), messageFromAcceptedSend (copy), MessageEnvelopeModelModule (upval), Signal (copy), Signal2 (copy)
				local Flag = false
				local DelayedThread = nil
				
				local function scheduleNext()
					-- upvalues: DelayedThread (ref), Flag (ref), Frozen2 (upval), p1 (upval), _Random (upval), Frozen (upval), messageFromAcceptedSend (upval), MessageEnvelopeModelModule (upval), Signal (upval), Signal2 (upval), scheduleNext (copy)
					DelayedThread = task.delay(2, function()
						-- upvalues: DelayedThread (upval), Flag (upval), Frozen2 (upval), p1 (upval), _Random (upval), Frozen (upval), messageFromAcceptedSend (upval), MessageEnvelopeModelModule (upval), Signal (upval), Signal2 (upval), scheduleNext (upval)
						DelayedThread = nil
						
						if not Flag then
							local CountFrozen2 = #Frozen2
							local _Random1 = if p1 then p1.random else nil
							local FrozenEntry = Frozen2[if _Random1 then _Random1:NextInteger(1, CountFrozen2) else _Random:NextInteger(1, CountFrozen2)]
							local CountFrozen = #Frozen
							local _Random2 = if p1 then p1.random else nil
							local IncomingResult = MessageEnvelopeModelModule.incoming((messageFromAcceptedSend(FrozenEntry, Frozen[if _Random2 then _Random2:NextInteger(1, CountFrozen) else _Random:NextInteger(1, CountFrozen)])))
							local Copy = table.clone(Signal(false))
							table.insert(Copy, IncomingResult)
							Signal2(Copy)
							scheduleNext()
							
							return
						end
					end)
				end
				
				DelayedThread = task.delay(2, function()
					-- upvalues: DelayedThread (ref), Flag (ref), Frozen2 (upval), p1 (upval), _Random (upval), Frozen (upval), messageFromAcceptedSend (upval), MessageEnvelopeModelModule (upval), Signal (upval), Signal2 (upval), scheduleNext (copy)
					DelayedThread = nil
					
					if not Flag then
						local CountFrozen2 = #Frozen2
						local _Random1 = if p1 then p1.random else nil
						local FrozenEntry = Frozen2[if _Random1 then _Random1:NextInteger(1, CountFrozen2) else _Random:NextInteger(1, CountFrozen2)]
						local CountFrozen = #Frozen
						local _Random2 = if p1 then p1.random else nil
						local IncomingResult = MessageEnvelopeModelModule.incoming((messageFromAcceptedSend(FrozenEntry, Frozen[if _Random2 then _Random2:NextInteger(1, CountFrozen) else _Random:NextInteger(1, CountFrozen)])))
						local Copy = table.clone(Signal(false))
						table.insert(Copy, IncomingResult)
						Signal2(Copy)
						scheduleNext()
						
						return
					end
				end)
				
				return function()
					-- upvalues: Flag (ref), DelayedThread (ref)
					Flag = true
					
					if DelayedThread ~= nil then
						task.cancel(DelayedThread)
						DelayedThread = nil
					end
				end
			end,
			destroy = function()
				-- upvalues: Tbl (copy)
				for i in Tbl do
					task.cancel(i)
				end
				table.clear(Tbl)
			end
		}
	end,
	senderPool = Frozen,
	incomingLines = Frozen1,
	incomingContents = Frozen2
}