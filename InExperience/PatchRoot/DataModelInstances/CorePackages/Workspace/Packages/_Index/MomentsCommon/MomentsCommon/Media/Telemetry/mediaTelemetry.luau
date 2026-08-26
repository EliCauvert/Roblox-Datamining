local function noop() end

return {
	noopSink = {
		recordDownload = noop,
		recordDecode = noop,
		recordTimeToFirstFrame = noop,
		recordCache = noop,
		recordSoftwareFallback = noop,
		recordDwell = noop
	},
	createLoggingSink = function(p1)
		p1 = p1 or print
		
		return {
			recordDownload = function(p2)
				-- upvalues: p1 (ref)
				p1(`[media] download moment={p2.momentId} kind={p2.assetKind} dt={p2.durationSeconds}s ok={p2.success}`)
			end,
			recordDecode = function(p2)
				-- upvalues: p1 (ref)
				p1(`[media] decode moment={p2.momentId} dt={p2.durationSeconds}s ok={p2.success}`)
			end,
			recordTimeToFirstFrame = function(p2)
				-- upvalues: p1 (ref)
				p1(`[media] ttff moment={p2.momentId} dt={p2.durationSeconds}s`)
			end,
			recordCache = function(p2)
				-- upvalues: p1 (ref)
				p1(`[media] cache moment={p2.momentId} stage={p2.stage} kind={p2.assetKind} hit={p2.hit}`)
			end,
			recordSoftwareFallback = function(p2)
				-- upvalues: p1 (ref)
				p1(`[media] software-fallback moment={p2.momentId}`)
			end,
			recordDwell = function(p2)
				-- upvalues: p1 (ref)
				p1(`[media] dwell moment={p2.momentId} dt={p2.durationSeconds}s`)
			end
		}
	end
}