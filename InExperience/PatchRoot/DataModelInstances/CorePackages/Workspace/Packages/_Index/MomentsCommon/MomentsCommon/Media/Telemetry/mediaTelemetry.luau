local function noop() --[[ Line: 52 ]] end

return {
	noopSink = {
		recordDownload = noop,
		recordDecode = noop,
		recordTimeToFirstFrame = noop,
		recordCache = noop,
		recordSoftwareFallback = noop,
		recordDwell = noop
	},
	createLoggingSink = function(p1) --[[ Line: 63 ]]
		local Callback = p1 or print
		
		return {
			recordDownload = function(p2) --[[ Line: 67 ]]
				-- upvalues: Callback (copy)
				Callback(`[media] download moment={p2.momentId} kind={p2.assetKind} dt={p2.durationSeconds}s ok={p2.success}`)
			end,
			recordDecode = function(p2) --[[ Line: 72 ]]
				-- upvalues: Callback (copy)
				Callback(`[media] decode moment={p2.momentId} dt={p2.durationSeconds}s ok={p2.success}`)
			end,
			recordTimeToFirstFrame = function(p2) --[[ Line: 75 ]]
				-- upvalues: Callback (copy)
				Callback(`[media] ttff moment={p2.momentId} dt={p2.durationSeconds}s`)
			end,
			recordCache = function(p2) --[[ Line: 78 ]]
				-- upvalues: Callback (copy)
				Callback(`[media] cache moment={p2.momentId} stage={p2.stage} kind={p2.assetKind} hit={p2.hit}`)
			end,
			recordSoftwareFallback = function(p2) --[[ Line: 81 ]]
				-- upvalues: Callback (copy)
				Callback(`[media] software-fallback moment={p2.momentId}`)
			end,
			recordDwell = function(p2) --[[ Line: 84 ]]
				-- upvalues: Callback (copy)
				Callback(`[media] dwell moment={p2.momentId} dt={p2.durationSeconds}s`)
			end
		}
	end
}