{* 
	Для вывода кнопки открытия формы используем код:
	<span data-uf-open="/engine/ajax/uniform/uniform.php" data-uf-settings='{"formConfig": "feedback"}' class="uf-btn">Feedback</span> 
	*}
	<div class="uf-wrapper">
		<span class="mfp-close">&times;</span>
		<div class="uf-header">
			Feedback
		</div>
		[debug]<div class="uf-content">{debug}</div>[/debug]
		[uf_token_error]
		<div class="uf-alert uf-alert-error">
			<b>Something went wrong, please try again</b>
		</div>
		[/uf_token_error]
		[success]
		<div class="uf-content">
			<b>Thank you! Your message has been successfully sent.</b>
			<p>We will contact you as soon as possible.</p>
		</div>
		[/success]
		[form]
		<div class="uf-content">		
			<div class="uf-field">
				<div class="uf-field-input">
					<input class="uf-input uf-input-first[uf_error_email] uf-input-error[/uf_error_email][uf_email_error] uf-input-error[/uf_email_error]" type="text" name="email" value="" data-value="{uf_field_email}" placeholder="Ваш Email">
					[uf_error_email]<div class="uf-field-notify">You didn't enter your email address</div>[/uf_error_email]
					[uf_email_error]<div class="uf-field-notify">Invalid email address</div>[/uf_email_error]
				</div>
			</div>
			<div class="uf-field">
				<div class="uf-field-input">
					<textarea class="uf-input [uf_error_textarea]uf-input-error[/uf_error_textarea]" name="textarea" rows="5" placeholder="Your message">{uf_field_textarea}</textarea>
					[uf_error_textarea]<div class="uf-field-notify">Required fields</div>[/uf_error_textarea]
          [uf_error_min_textarea]<div class="uf-field-notify">Min length 15 chars</div>[/uf_error_min_textarea]
				</div>
			</div>
			<div class="uf-field">
				<div class="uf-field-input">
					<button class="uf-btn ladda-button" type="submit" data-style="zoom-in"><span class="ladda-label">Send a message</span></button>
				</div>
			</div>
		</div>
		[/form]
	</div>
