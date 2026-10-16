local Parent = script:FindFirstAncestor("Moments").Parent
local SignalsModule = require(Parent.Signals)
local CryoModule = require(Parent.Cryo)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local config = { shareCount = 0, hasShared = false }

return function() --[[ Line: 29 | Named "createShareCountsStore" ]]
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), config (copy), CryoModule (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Tbl = {}
	
	return {
		getShareInfoByMomentId = Signal,
		getShareInfo = function(Key) --[[ Line: 34 ]]
			-- upvalues: Tbl (copy), CreateComputedFunction (upval), Signal (copy), config (upval)
			if Tbl[Key] == nil then
				Tbl[Key] = CreateComputedFunction(function(p1) --[[ Line: 36 ]]
					-- upvalues: Signal (upval), Key (copy), config (upval)
					return Signal(p1)[Key] or config
				end)
			end
			return Tbl[Key]
		end,
		setBatchShareCounts = function(p1) --[[ Line: 43 ]]
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl) --[[ Line: 44 ]]
				-- upvalues: p1 (copy)
				local Copy = table.clone(Tbl)
				
				for i, value in p1 do
					local Entry = Tbl[i]
					
					if Entry == nil or not Entry.hasShared or value.hasShared then
						Copy[i] = value
					else
						Copy[i] = {
							hasShared = true,
							shareCount = math.max(Entry.shareCount, value.shareCount)
						}
					end
				end
				return Copy
			end)
		end,
		setShareCount = function(p2, ShareCount, HasShared) --[[ Line: 61 ]]
			-- upvalues: Signal2 (copy), CryoModule (upval)
			Signal2(function(p3) --[[ Line: 62 ]]
				-- upvalues: CryoModule (upval), p2 (copy), ShareCount (copy), HasShared (copy)
				return (CryoModule.Dictionary.union(p3, {
					[p2] = { shareCount = ShareCount, hasShared = HasShared }
				}))
			end)
		end,
		markShared = function(p2) --[[ Line: 72 ]]
			-- upvalues: Signal (copy), config (upval), Signal2 (copy), CryoModule (upval)
			local SignalResult = Signal(false)
			local SignalResultEntry = SignalResult[p2] or config
			
			if not SignalResultEntry.hasShared then
				Signal2((CryoModule.Dictionary.union(SignalResult, {
					[p2] = {
						hasShared = true,
						shareCount = SignalResultEntry.shareCount + 1
					}
				})))
				
				return
			end
		end,
		clear = function() --[[ Line: 86 ]]
			-- upvalues: Signal2 (copy), Tbl (copy)
			Signal2({})
			table.clear(Tbl)
		end
	}
end