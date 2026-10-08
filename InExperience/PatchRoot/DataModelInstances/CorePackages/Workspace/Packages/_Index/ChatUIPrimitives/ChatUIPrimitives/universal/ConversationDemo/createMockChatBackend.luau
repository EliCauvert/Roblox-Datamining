local signalsModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.Signals)
local messageModelModule = require(script.Parent.Parent.MessageModel)
local _ = require(script.Parent.Parent.Types)
local frozen = table.freeze({
	{ userId = "1", displayName = "Roblox" },
	{ userId = "156", displayName = "Builderman" }
})
local frozen_1 = table.freeze({
	"Switching to Bright blue, red team is stacked",
	"Who just bloxxed me off the tower??",
	"12 KOs and still top of the leaderboard, come get me",
	"gg! Sending you a friend request", "Where is everyone? The map is empty",
	"/regen the bridge is gone again", "Anyone on yellow want to team up?",
	"Got bloxxed by my own rocket lol", "Meet at the middle tower, bring a sword",
	"Friend request sent, let's run it back", "Changing teams, green has nobody",
	"Who keeps blowing up the house? /regen"
})

local function _(p1)
	local var1 = p1.contents[1]
	
	return if var1 == nil or var1.plainText == nil then nil else var1.plainText.text
end

return {
	incomingIntervalSeconds = 2,
	welcomeText = "Welcome to Crossroads! Type /regen if someone wrecks the map.",
	create = function(p1, p2)
		-- upvalues: signalsModule (ref), messageModelModule (ref), frozen (ref), frozen_1 (ref)
		local t = { displayName = "You", userId = p1 }
		local random = Random.new()
		
		local function _(p3, p4)
			-- upvalues: p2 (ref), random (ref)
			local var1 = if p2 then p2.random else nil
			
			return if var1 then var1:NextInteger(p3, p4) else random:NextInteger(p3, p4)
		end
		
		local _ = function(p3)
			-- upvalues: p2 (ref), random (ref)
			local p5Count = #p3
			local var1 = if p2 then p2.random else nil
			
			return p3[if var1 then var1:NextInteger(1, p5Count) else random:NextInteger(1, p5Count)]
		end
		
		local var2, var3 = signalsModule.createSignal({})
		local var4 = 0
		
		local _ = function()
			-- upvalues: p2 (ref)
			local var5 = if p2 then p2.getNowMs else nil
			
			return if var5 then var5() else DateTime.now().UnixTimestampMillis
		end
		
		local _ = function(p4)
			-- upvalues: var2 (ref), var3 (ref)
			local cloned = table.clone(var2(false))
			table.insert(cloned, p4)
			var3(cloned)
		end
		
		local _ = function(p4, p5)
			-- upvalues: var4 (write), p2 (ref), messageModelModule (copy)
			local var5 = if p2 then p2.getNowMs else nil
			var4 = math.max(if var5 then var5() else DateTime.now().UnixTimestampMillis, var4 + 1)
			
			return messageModelModule.fromPlainText(p4, { sentAtUnixMilliseconds = var4, author = p5 })
		end
		
		local frozenCount = #frozen
		local var5 = if p2 then p2.random else nil
		local var6 = frozen[if var5 then var5:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)]
		local var7 = if p2 then p2.getNowMs else nil
		var4 = math.max(if var7 then var7() else DateTime.now().UnixTimestampMillis, var4 + 1)
		local var8 = messageModelModule.fromPlainText("Welcome to Crossroads! Type /regen if someone wrecks the map.", { sentAtUnixMilliseconds = var4, author = var6 })
		local cloned = table.clone(var2(false))
		table.insert(cloned, var8)
		var3(cloned)
		
		local _ = function()
			-- upvalues: frozen_1 (copy), p2 (ref), random (ref), frozen (copy), var4 (write), messageModelModule (copy), var2 (ref), var3 (ref)
			local frozen_1Count = #frozen_1
			local var9 = if p2 then p2.random else nil
			local var10 = frozen_1[if var9 then var9:NextInteger(1, frozen_1Count) else random:NextInteger(1, frozen_1Count)]
			local frozenCount = #frozen
			local var11 = if p2 then p2.random else nil
			local var12 = frozen[if var11 then var11:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)]
			local var13 = if p2 then p2.getNowMs else nil
			var4 = math.max(if var13 then var13() else DateTime.now().UnixTimestampMillis, var4 + 1)
			local cloned = table.clone(var2(false))
			table.insert(cloned, messageModelModule.fromPlainText(var10, { sentAtUnixMilliseconds = var4, author = var12 }))
			var3(cloned)
		end
		
		return {
			getMessages = var2,
			sendMessageDraft = function(p4)
				-- upvalues: t (ref), var4 (write), p2 (ref), messageModelModule (copy), var2 (ref), var3 (ref)
				local var14 = p4.contents[1]
				local var15 = if var14 == nil or var14.plainText == nil then nil else var14.plainText.text
				
				if var15 == nil or var15 == "" then
					return { accepted = false }
				end
				local var16 = if p2 then p2.getNowMs else nil
				var4 = math.max(if var16 then var16() else DateTime.now().UnixTimestampMillis, var4 + 1)
				local var17 = messageModelModule.fromPlainText(var15, { sentAtUnixMilliseconds = var4, author = t })
				task.defer(function()
					-- upvalues: var17 (ref), var2 (copy), var3 (copy)
					local cloned = table.clone(var2(false))
					table.insert(cloned, var17)
					var3(cloned)
				end)
				
				return { accepted = true, messageId = var17.id }
			end,
			startIncomingTraffic = function()
				-- upvalues: frozen_1 (copy), p2 (ref), random (ref), frozen (copy), var4 (write), messageModelModule (copy), var2 (ref), var3 (ref)
				local var14 = false
				local delayedThread = nil
				
				local function scheduleNext()
					-- upvalues: delayedThread (write), var14 (write), frozen_1 (copy), p2 (copy), random (copy), frozen (copy), var4 (copy), messageModelModule (copy), var2 (copy), var3 (copy), scheduleNext (ref)
					delayedThread = task.delay(2, function()
						-- upvalues: delayedThread (copy), var14 (copy), frozen_1 (copy), p2 (copy), random (copy), frozen (copy), var4 (copy), messageModelModule (copy), var2 (copy), var3 (copy), scheduleNext (copy)
						delayedThread = nil
						
						if var14 then
							return
						end
						local frozen_1Count = #frozen_1
						local var15 = if p2 then p2.random else nil
						local var16 = frozen_1[if var15 then var15:NextInteger(1, frozen_1Count) else random:NextInteger(1, frozen_1Count)]
						local frozenCount = #frozen
						local var17 = if p2 then p2.random else nil
						local var18 = frozen[if var17 then var17:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)]
						local var19 = if p2 then p2.getNowMs else nil
						var4 = math.max(if var19 then var19() else DateTime.now().UnixTimestampMillis, var4 + 1)
						local cloned = table.clone(var2(false))
						table.insert(cloned, messageModelModule.fromPlainText(var16, { sentAtUnixMilliseconds = var4, author = var18 }))
						var3(cloned)
						scheduleNext()
					end)
				end
				
				delayedThread = task.delay(2, function()
					-- upvalues: delayedThread (write), var14 (write), frozen_1 (copy), p2 (copy), random (copy), frozen (copy), var4 (copy), messageModelModule (copy), var2 (copy), var3 (copy), scheduleNext (ref)
					delayedThread = nil
					
					if var14 then
						return
					end
					local frozen_1Count = #frozen_1
					local var20 = if p2 then p2.random else nil
					local var21 = frozen_1[if var20 then var20:NextInteger(1, frozen_1Count) else random:NextInteger(1, frozen_1Count)]
					local frozenCount = #frozen
					local var22 = if p2 then p2.random else nil
					local var23 = frozen[if var22 then var22:NextInteger(1, frozenCount) else random:NextInteger(1, frozenCount)]
					local var24 = if p2 then p2.getNowMs else nil
					var4 = math.max(if var24 then var24() else DateTime.now().UnixTimestampMillis, var4 + 1)
					local cloned = table.clone(var2(false))
					table.insert(cloned, messageModelModule.fromPlainText(var21, { sentAtUnixMilliseconds = var4, author = var23 }))
					var3(cloned)
					scheduleNext()
				end)
				
				return function()
					-- upvalues: var14 (write), delayedThread (write)
					var14 = true
					
					if delayedThread ~= nil then
						task.cancel(delayedThread)
						delayedThread = nil
					end
				end
			end
		}
	end,
	senderPool = frozen,
	incomingLines = frozen_1
}