<?php
/* @var $this yii\web\View */
/* @var $model app\models\Feedback */
/* @var $form ActiveForm */

$this->title = 'Positron';

use app\models\Books;
use app\models\Category;
use himiklab\yii2\recaptcha\ReCaptcha3;
use yii\base\BaseObject;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;

?>
<div class="site-index">

    <div class="container">
        <div class="row flex-column">
            <section class="book" style="display: flex; flex-wrap: wrap;">
            <?php foreach ($query as $item): ?>
                <div class="card" style="width: 18rem; margin: 0 50px 50px 0; padding: 10px;">
                    <img class="card-img-top" src="<?= $item['thumbnailUrl'] ?>" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><?= $item['title'] ?></h5>
                        <p class="card-text"> <?= $item['shortDescription'] ?></p>
                    </div>
                    <button class="btn btn-info">Подробнее</button>
                </div>
            <?php endforeach; ?>
            </section>
<!--            Условие отправления формы, если она отправлена выводим сообщение-->
            <?php if (Yii::$app->session->hasFlash('contactFormSubmitted')): ?>

                <div class="alert alert-success">
                    Спасибо за обращение к нам. Мы постараемся ответить вам как можно скорее.
                </div>
            <?php endif; ?>
<!--               иначе выводим форму-->
            <div class="feedback-index col-lg-6" style="margin: auto;">
                <?php $form = ActiveForm::begin(['id' => 'contact-form', 'options' => ['class' => 'form-horizontal']]); ?>

                <?= $form->field($model, 'email')->textInput() ?>
                <?= $form->field($model, 'message')->textarea(['rows' => 6]) ?>
                <?= $form->field($model, 'phone')->textInput() ?>
                <?= $form->field($model, 'name')->textInput() ?>
                <?= $form->field($model, 'reCaptcha')->widget(ReCaptcha3::className())  ?>
                    <?= Html::submitButton(Yii::t('app', 'Отправить сообщение'), ['class' => 'btn btn-primary']) ?>
                </div>
                <?php ActiveForm::end(); ?>

            </div><!-- feedback-index -->

        </div>
    </div>
</div>
