<!-- Все ссылки должны иметь класс redirect-modal-share-link
ссылки которые показывают модал иметь класс redirect-modal-start -->

<div class="modal-overlay">
	<div class="modal-dialog">
		<span class="modal-dialog__close"></span>
		<div class="modal-dialog__title">Thanks! <br> Your download will start in <span id="redirect-modal-timer">{timer}</span> seconds!</div>
		<div class="modal-dialog__desc">Or share this page in the social network, and get the app you want immediately ;)</div>
		<div class="modal-dialog__social">
			<div id="social_share">
				<a class="fb redirect-modal-share-link" data-type="fb">Facebook</a>
				<a class="tw redirect-modal-share-link" data-type="tw">Twitter</a>
				<a class="pt redirect-modal-share-link" data-type="pt">Pinterest</a>
				<a class="tg redirect-modal-share-link" data-type="tg">Telegram</a>
				<script async src="https://cdn.itense.group/share/social_share.js"></script>
			</div>
		</div>

	</div>
</div>


<style>
#redirect-modal-timer {
	background-color: #f1f1f1;
    color: #000000;
    padding: 0.2em 0.5em;
    border-radius: 3px;
}
.redirect-modal {
	display: none;
	position: fixed;
	z-index: 999999;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	}
.modal-overlay {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: center;
        -ms-flex-pack: center;
            justify-content: center;
    -webkit-box-align: center;
        -ms-flex-align: center;
            align-items: center;
    width: 100%;
    height: 100%;
}

.modal-dialog {
    position: relative;
    width: 460px;
    height: auto;
    padding: 1.5em;
    background-color: #fff;
    -webkit-box-shadow: 0 0 12px 0 rgba(0, 0, 0, 0.3);
            box-shadow: 0 0 12px 0 rgba(0, 0, 0, 0.3);
}
.modal-dialog__title {
    font-size: 1.9rem;
    margin-bottom: 1em;
    font-weight: 700;
    text-align: center;
}
.modal-dialog__desc {
    text-align: center;
    padding: 1em;
    background-color: #FFF8E0;
    margin-bottom: 1.4em;
    color: #615323;
    font-size: 1.5rem;
}
.modal-dialog__social {
    text-align: center;
    margin-bottom: 1.2em;
}
.modal-dialog__timer {
    text-align: center;
    font-size: 1.7rem;
}
.modal-dialog__close {
    position: absolute;
    right: 10px;
    top: 10px;
    width: 25px;
    height: 25px;
    opacity: 0.3;
    cursor: pointer;
}
.modal-dialog__close:hover {
	opacity: 1;
}
.modal-dialog__close:before, .modal-dialog__close:after {
    position: absolute;
    left: 11px;
    content: ' ';
    height: 25px;
    width: 2px;
    background-color: #333;
}
.modal-dialog__close:before {
	-webkit-transform: rotate(45deg);
	    -ms-transform: rotate(45deg);
	        transform: rotate(45deg);
}
.modal-dialog__close:after {
	-webkit-transform: rotate(-45deg);
	    -ms-transform: rotate(-45deg);
	        transform: rotate(-45deg);
}
</style>