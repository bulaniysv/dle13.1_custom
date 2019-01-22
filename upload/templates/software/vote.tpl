<div id="votes" class="vote">
	<div class="vote__title">{title}</div>
	[votelist]
	<form method="post" name="vote">
		[/votelist]
		<div class="vote_list">
			{list}
		</div>
		[voteresult]
		<div class="vote_votes grey">Voted: {votes}</div>
		[/voteresult]
		[votelist]
		<input type="hidden" name="vote_action" value="vote">
		<input type="hidden" name="vote_id" id="vote_id" value="{vote_id}">
		<button title="Vote" class="btn btn-white" type="submit" onclick="doVote('vote'); return false;" ><b>Vote</b></button>
		<button title="Voting results" class="btn-border" type="button" onclick="doVote('results'); return false;" >
			<svg class="icon icon-votes"><use xlink:href="#icon-votes"></use></svg>
		</button>
	</form>
	[/votelist]
</div>